const {
  getRotationMatrix,
  matrixMultiply,
  transformPointByRotationMatrix,
  addVectors,
  transpose3x3
} = require('./matrixUtil.js');

let WebSocketClient;

if (typeof window !== 'undefined' && typeof window.WebSocket !== 'undefined') {
  WebSocketClient = window.WebSocket;
} else {
  WebSocketClient = require('ws');
}

class Voxelamming {
  constructor(roomName) {
    this.textureNames = ["grass", "stone", "dirt", "planks", "bricks"];
    this.modelNames = ["Mercury", "Venus", "Earth", "Mars", "Jupiter", "Saturn", "Uranus", "Neptune", "Pluto", "Sun",
      "Moon", "ToyBiplane", "ToyCar", "Drummer", "Robot", "ToyRocket", "RocketToy1", "RocketToy2", "Skull"];
    this.roomName = roomName;
    this.isAllowedMatrix = 0;
    this.savedMatrices = [];
    this.nodeTransform = [0, 0, 0, 0, 0, 0];
    this.matrixTransform = [0, 0, 0, 0, 0, 0];
    this.frameTransforms = [];
    this.globalAnimation = [0, 0, 0, 0, 0, 0, 1, 0]
    this.animation = [0, 0, 0, 0, 0, 0, 1, 0]
    this.boxes = [];
    this.frames = [];
    this.sentences = []
    this.lights = [];
    this.commands = [];
    this.models = [];
    this.modelMoves = [];
    this.sprites = [];
    this.spriteMoves = [];
    this.gameScore = -1;
    this.gameScreen = [] // width, height, angle=90, red=1, green=1, blue=1, alpha=0.5
    this.size = 1.0;
    this.shape = 'box'
    this.isMetallic = 0
    this.roughness = 0.5
    this.isAllowedFloat = 0
    this.buildInterval = 0.01;
    this.isFraming = false;
    this.frameId = 0;
    this.rotationStyles = {}; // 回転の制御（送信しない）
    this.socket = null;
    this.inactivityTimeout = null; // 非アクティブタイマー
    this.inactivityDelay = 2000; // 2秒後に接続を切断
  }

  async clearData() {
    return new Promise((resolve) => {
      setTimeout(() => {
        this.isAllowedMatrix = 0;
        this.savedMatrices = [];
        this.nodeTransform = [0, 0, 0, 0, 0, 0];
        this.matrixTransform = [0, 0, 0, 0, 0, 0];
        this.frameTransforms = [];
        this.globalAnimation = [0, 0, 0, 0, 0, 0, 1, 0];
        this.animation = [0, 0, 0, 0, 0, 0, 1, 0];
        this.boxes = [];
        this.frames = [];
        this.sentences = [];
        this.lights = [];
        this.commands = [];
        this.models = [];
        this.modelMoves = [];
        this.sprites = [];
        this.spriteMoves = [];
        this.gameScore = -1;
        this.gameScreen = [] // width, height, angle=90, red=1, green=0, blue=1, alpha=0.3
        this.size = 1.0;
        this.shape = 'box';
        this.isMetallic = 0;
        this.roughness = 0.5;
        this.isAllowedFloat = 0;
        this.buildInterval = 0.01;
        this.isFraming = false;
        this.frameId = 0;
        this.rotationStyles = {}; // 回転の制御（送信しない）

        // すべての初期化が完了したらresolveを呼び出す
        resolve();
      }, 0); // 遅延を0に設定
    });
  }

  setFrameFPS(fps = 2) {
    this.commands.push(`fps ${fps}`);
  }

  setFrameRepeats(repeats = 10) {
    this.commands.push(`repeats ${repeats}`);
  }

  frameIn() {
    this.isFraming = true;
  }

  frameOut() {
    this.isFraming = false;
    this.frameId++;
  }

  pushMatrix() {
    this.isAllowedMatrix++;
    this.savedMatrices.push(this.matrixTransform);
  }

  popMatrix() {
    this.isAllowedMatrix--;
    this.matrixTransform = this.savedMatrices.pop();
  }

  transform(x, y, z, pitch = 0, yaw = 0, roll = 0) {
    if (this.isAllowedMatrix) {
      // 移動用のマトリックスを計算する
      const matrix = this.savedMatrices[this.savedMatrices.length - 1];
      const basePosition = matrix.slice(0, 3);

      let baseRotationMatrix;
      if (matrix.length === 6) {
        baseRotationMatrix = getRotationMatrix(...matrix.slice(3));
      } else {
        baseRotationMatrix = [
          matrix.slice(3, 6),
          matrix.slice(6, 9),
          matrix.slice(9, 12)
        ];
      }

      const [addX, addY, addZ] = transformPointByRotationMatrix([x, y, z], transpose3x3(baseRotationMatrix));

      [x, y, z] = addVectors(basePosition, [addX, addY, addZ]);
      [x, y, z] = this.roundNumbers([x, y, z]);

      const transformRotationMatrix = getRotationMatrix(-pitch, -yaw, -roll);
      const rotateMatrix = matrixMultiply(transformRotationMatrix, baseRotationMatrix);

      this.matrixTransform = [x, y, z, ...rotateMatrix[0], ...rotateMatrix[1], ...rotateMatrix[2]];
    } else {
      [x, y, z] = this.roundNumbers([x, y, z]);

      if (this.isFraming) {
        this.frameTransforms.push([x, y, z, pitch, yaw, roll, this.frameId]);
      } else {
        this.nodeTransform = [x, y, z, pitch, yaw, roll];
      }
    }
  }

  createBox(x, y, z, r=1, g=1, b=1, alpha=1, texture='') {
    if (this.isAllowedMatrix) {
      // 移動用のマトリックスにより位置を計算する
      const matrix = this.matrixTransform;
      const basePosition = matrix.slice(0, 3);

      let baseRotationMatrix;
      if (matrix.length === 6) {
        baseRotationMatrix = getRotationMatrix(...matrix.slice(3));
      } else {
        baseRotationMatrix = [
          matrix.slice(3, 6),
          matrix.slice(6, 9),
          matrix.slice(9, 12)
        ];
      }

      const [addX, addY, addZ] = transformPointByRotationMatrix([x, y, z], transpose3x3(baseRotationMatrix));
      [x, y, z] = addVectors(basePosition, [addX, addY, addZ]);
    }

    [x, y, z] = this.roundNumbers([x, y, z]);
    [r, g, b, alpha] = this.roundTwoDecimals([r, g, b, alpha]);
    // 重ねておくことを防止
    this.removeBox(x, y, z);

    let textureId;
    if (!this.textureNames.includes(texture)) {
      textureId = -1;
    } else {
      textureId = this.textureNames.indexOf(texture);
    }

    if (this.isFraming) {
      this.frames.push([x, y, z, r, g, b, alpha, textureId, this.frameId]);
    } else {
      this.boxes.push([x, y, z, r, g, b, alpha, textureId]);
    }
  }

  removeBox(x, y, z) {
    [x, y, z] = this.roundNumbers([x, y, z]);

    if (this.isFraming) {
      for (let i = 0; i < this.frames.length; i++) {
        let box = this.frames[i];
        if (box[0] === x && box[1] === y && box[2] === z && box[8] === this.frameId) {
          this.frames.splice(i, 1);
          break;
        }
      }
    } else {
      for (let i = 0; i < this.boxes.length; i++) {
        let box = this.boxes[i];
        if (box[0] === x && box[1] === y && box[2] === z) {
          this.boxes.splice(i, 1);
          break;
        }
      }
    }
  }

  animateGlobal(x, y, z, pitch = 0, yaw = 0, roll = 0, scale = 1, interval = 10) {
    [x, y, z] = this.roundNumbers([x, y, z]);
    this.globalAnimation = [x, y, z, pitch, yaw, roll, scale, interval];
  }

  animate(x, y, z, pitch=0, yaw=0, roll=0, scale=1, interval=10) {
    [x, y, z] = this.roundNumbers([x, y, z]);
    this.animation = [x, y, z, pitch, yaw, roll, scale, interval]
  }

  setBoxSize(boxSize) {
    this.size = boxSize;
  }

  setBuildInterval(interval) {
    this.buildInterval = interval;
  }

  writeSentence(sentence, x, y, z, r=1, g=1, b=1, alpha=1, fontSize=16, isFixedFont=false) {
    [x, y, z] = this.roundNumbers([x, y, z]);
    [r, g, b, alpha] = this.roundTwoDecimals([r, g, b, alpha]);
    [x, y, z] = [x, y, z].map(val => String(val));
    [r, g, b, alpha, fontSize] = [r, g, b, alpha, fontSize].map(val => String(val));
    this.sentences.push([sentence, x, y, z, r, g, b, alpha, fontSize, isFixedFont ? "1" : "0"]);
  }

  setLight(x, y, z, r=1, g=1, b=1, alpha=1, intensity=1000, interval=1, lightType='point') {
    [x, y, z] = this.roundNumbers([x, y, z]);
    [r, g, b, alpha] = this.roundTwoDecimals([r, g, b, alpha]);

    if (lightType === 'point') {
      lightType = 1;
    } else if (lightType === 'spot') {
      lightType = 2;
    } else if (lightType === 'directional') {
      lightType = 3;
    } else {
      lightType = 1;
    }
    this.lights.push([x, y, z, r, g, b, alpha, intensity, interval, lightType]);
  }

  setCommand(command) {
    this.commands.push(command);

    if (command === 'float') {
      this.isAllowedFloat = 1;
    }
  }

  drawLine(x1, y1, z1, x2, y2, z2, r = 1, g = 1, b = 1, alpha = 1) {
    [x1, y1, z1, x2, y2, z2] = this.roundNumbers([x1, y1, z1, x2, y2, z2])
    const diff_x = x2 - x1;
    const diff_y = y2 - y1;
    const diff_z = z2 - z1;
    const maxLength = Math.max(Math.abs(diff_x), Math.abs(diff_y), Math.abs(diff_z));

    if (diff_x === 0 && diff_y === 0 && diff_z === 0) {
      return false;
    }

    if (Math.abs(diff_x) === maxLength) {
      if (x2 > x1) {
        for (let x = x1; x <= x2; x++) {
          const y = y1 + (x - x1) * diff_y / diff_x;
          const z = z1 + (x - x1) * diff_z / diff_x;
          this.createBox(x, y, z, r, g, b, alpha);
        }
      } else{
        for (let x = x1; x >= x2; x--) {
          const y = y1 + (x - x1) * diff_y / diff_x;
          const z = z1 + (x - x1) * diff_z / diff_x;
          this.createBox(x, y, z, r, g, b, alpha);
        }
      }
    } else if (Math.abs(diff_y) === maxLength) {
      if (y2 > y1) {
        for (let y = y1; y <= y2; y++) {
          const x = x1 + (y - y1) * diff_x / diff_y;
          const z = z1 + (y - y1) * diff_z / diff_y;
          this.createBox(x, y, z, r, g, b, alpha);
        }
      } else {
        for (let y = y1; y >= y2; y--) {
          const x = x1 + (y - y1) * diff_x / diff_y;
          const z = z1 + (y - y1) * diff_z / diff_y;
          this.createBox(x, y, z, r, g, b, alpha);
        }
      }
    } else if (Math.abs(diff_z) === maxLength) {
      if (z2 > z1) {
        for (let z = z1; z <= z2; z++) {
          const x = x1 + (z - z1) * diff_x / diff_z;
          const y = y1 + (z - z1) * diff_y / diff_z;
          this.createBox(x, y, z, r, g, b, alpha);
        }
      } else {
        for (let z = z1; z >= z2; z--) {
          const x = x1 + (z - z1) * diff_x / diff_z;
          const y = y1 + (z - z1) * diff_y / diff_z;
          this.createBox(x, y, z, r, g, b, alpha);
        }
      }
    }
  }

  changeShape(shape) {
    this.shape = shape;
  }

  changeMaterial(isMetallic, roughness) {
    this.isMetallic = isMetallic ? 1 : 0;
    this.roughness = roughness;
  }

  createModel(modelName, x = 0, y = 0, z = 0,
              pitch = 0, yaw = 0, roll = 0, scale = 1, entityName = '') {
    if (this.modelNames.includes(modelName)) {
      [x, y, z, pitch, yaw, roll, scale] = this.roundTwoDecimals([x, y, z, pitch, yaw, roll, scale]);
      [x, y, z, pitch, yaw, roll, scale] = [x, y, z, pitch, yaw, roll, scale].map(String);

      this.models.push([modelName, x, y, z, pitch, yaw, roll, scale, entityName]);
    } else {
      console.log(`No model name: ${modelName}`);
    }
  }

  moveModel(entityName, x = 0, y = 0, z = 0,
            pitch = 0, yaw = 0, roll = 0, scale = 1) {
    [x, y, z, pitch, yaw, roll, scale] = this.roundTwoDecimals([x, y, z, pitch, yaw, roll, scale]);
    [x, y, z, pitch, yaw, roll, scale] = [x, y, z, pitch, yaw, roll, scale].map(String);

    this.modelMoves.push([entityName, x, y, z, pitch, yaw, roll, scale]);
  }

  // Game API

  // ゲーム画面の設定
  setGameScreen(width, height, angle = 90, red = 1, green = 1, blue = 0, alpha = 0.5) {
    this.gameScreen = [width, height, angle, red, green, blue, alpha];
  }

  // ゲームスコアの設定
  setGameScore(score, x = 0, y = 0) {
    score = parseFloat(score);
    x = parseFloat(x);
    y = parseFloat(y);
    this.gameScore = [score, x, y];
  }

  // ゲームオーバーの送信
  sendGameOver() {
    this.commands.push('gameOver');
  }

  // 回転スタイルの設定
  setRotationStyle(spriteName, rotationStyle = 'all around') {
    this.rotationStyles[spriteName] = rotationStyle;
  }

  // スプライトの作成と表示について、テンプレートとクローンの概念を導入する
  // テンプレートはボクセルの集合で、標準サイズは8x8に設定する
  // この概念により、スプライトの複数作成が可能となる（敵キャラや球など）
  // スプライトは、ボクセラミングアプリ上で、テンプレートとして作成される（isEnable=falseにより表示されない）
  // スプライトは、テンプレートのクローンとして画面上に表示される
  // 送信ごとに、クローンはすべて削除されて、新しいクローンが作成される
  // 上記の仕様により、テンプレートからスプライトを複数作成できる

  // スプライトのテンプレートを作成（スプライトは配置されない）
  createSpriteTemplate(spriteName, colorList) {
    this.sprites.push([spriteName, colorList]);
  }

  // スプライトのテンプレートを使って、複数のスプライトを表示する
  displaySpriteTemplate(spriteName, x, y, direction = 0, scale = 1) {
    // x, y, directionを丸める
    [x, y, direction] = this.roundNumbers([x, y, direction]);
    [x, y, direction, scale] = [x, y, direction, scale].map(String);

    // rotationStyleを取得
    if (this.rotationStyles[spriteName]) {
      let rotationStyle = this.rotationStyles[spriteName];

      // rotationStyleが変更された場合、新しいスプライトデータを配列に追加
      if (rotationStyle === 'left-right') {
        let directionMod = direction % 360;  // 常に0から359の範囲で処理（常に正の数になる）
        if (directionMod > 90 && directionMod < 270) {
          direction = "-180";  // -180は左右反転するようにボクセラミング側で実装されている
        } else {
          direction = "0";
        }
      } else if (rotationStyle === "don't rotate") {
        direction = "0";
      } else {
        direction = String(direction);
      }
    } else {
      // rotationStyleが設定されていない場合、そのままの値を使う
      direction = String(direction);
    }

    // spriteMoves 配列から指定されたスプライト名の情報を検索
    let matchingSprites = this.spriteMoves
      .map((info, index) => ({ index, info }))
      .filter(item => item.info[0] === spriteName);

    // スプライトの移動データを保存または更新
    if (matchingSprites.length === 0) {
      // 新しいスプライトデータをリストに追加
      this.spriteMoves.push([spriteName, x, y, direction, scale]);
    } else {
      // 既存のスプライトデータを更新（2つ目以降のスプライトデータ）
      let { index, info: spriteData } = matchingSprites[0];
      this.spriteMoves[index] = [...this.spriteMoves[index], x, y, direction, scale];
    }
  }

  // 通常のスプライトの作成
  createSprite(spriteName, colorList, x = 0, y = 0, direction = 0, scale = 1, visible = true) {
    // スプライトのテンプレートデータを配列に追加（これだけでは表示されない）
    this.createSpriteTemplate(spriteName, colorList);

    // スプライトが表示される場合、スプライトの移動データを配列に追加（これでスプライトが表示される）
    if (visible) {
      [x, y, direction] = this.roundNumbers([x, y, direction]);
      [x, y, direction, scale] = [x, y, direction, scale].map(String);
      this.spriteMoves.push([spriteName, x, y, direction, scale]);
    }
  }

  // 通常のスプライトの移動
  moveSprite(spriteName, x, y, direction = 0, scale = 1, visible = true) {
    if (visible) {
      // displaySpriteTemplateと同じ処理
      this.displaySpriteTemplate(spriteName, x, y, direction, scale);
    }
  }

  // ドット（弾）を表示する
  // ドットの表示は、特別な名前（dot_色_幅_高さ）のテンプレートとして表示する
  displayDot(x, y, direction = 0, colorId = 10, width = 1, height = 1) {
    let templateName = `dot_${colorId}_${width}_${height}`;
    this.displaySpriteTemplate(templateName, x, y, direction, 1);
  }

  // テキストを表示する
  // テキストの表示は、特別な名前（template_色_幅_高さ）のテンプレートとして表示する
  // 一度表示した後はテンプレートが自動で保存されているため、テンプレートをクローンとして表示できる
  displayText(text, x, y, direction = 0, scale = 1, colorId = 7, isVertical = false) {
    let templateName = `text_${text}_${colorId}_${isVertical ? "1" : "0"}`;
    this.displaySpriteTemplate(templateName, x, y, direction, scale);
  }

  async sendData(name = '') {
    console.log('Sending data...');
    const date = new Date();
    const dataToSend = {
      nodeTransform: this.nodeTransform,
      frameTransforms: this.frameTransforms,
      globalAnimation: this.globalAnimation,
      animation: this.animation,
      boxes: this.boxes,
      frames: this.frames,
      sentences: this.sentences,
      lights: this.lights,
      commands: this.commands,
      models: this.models,
      modelMoves: this.modelMoves,
      sprites: this.sprites,
      spriteMoves: this.spriteMoves,
      gameScore: this.gameScore,
      gameScreen: this.gameScreen,
      size: this.size,
      shape: this.shape,
      interval: this.buildInterval,
      isMetallic: this.isMetallic,
      roughness: this.roughness,
      isAllowedFloat: this.isAllowedFloat,
      name: name,
      date: date.toISOString()
    };

    return new Promise((resolve, reject) => {
      try {
        if (this.socket && this.socket.readyState === WebSocketClient.OPEN) {
          this.socket.send(JSON.stringify(dataToSend));
          console.log('Sent data to server (existing connection):', dataToSend);
          this.startInactivityTimer(); // タイマーを開始
          resolve();
        } else if (this.socket && this.socket.readyState === WebSocketClient.CONNECTING) {
          this.socket.onopen = () => {
            this.socket.send(this.roomName);
            console.log(`Joined room: ${this.roomName}`);
            this.socket.send(JSON.stringify(dataToSend));
            console.log('Sent data to server (connected):', dataToSend);
            this.startInactivityTimer(); // タイマーを開始
            resolve();
          };
        } else {
          this.socket = new WebSocketClient('wss://websocket.voxelamming.com');

          this.socket.onopen = () => {
            this.socket.send(this.roomName);
            console.log(`Joined room: ${this.roomName}`);
            this.socket.send(JSON.stringify(dataToSend));
            console.log('Sent data to server (new connection):', dataToSend);
            this.startInactivityTimer(); // タイマーを開始
            resolve();
          };

          this.socket.onerror = error => {
            console.error(`WebSocket error: ${error}`);
            reject(error);
          };

          this.socket.onclose = () => {
            console.log('WebSocket connection closed.');
          };
        }
      } catch (error) {
        console.error(`WebSocket connection failed: ${error}`);
        reject(error);
      }
    });
  }

  startInactivityTimer() {
    this.clearInactivityTimer(); // 既存のタイマーをクリア
    this.inactivityTimeout = setTimeout(() => {
      if (this.socket && this.socket.readyState === WebSocketClient.OPEN) {
        console.log('No data sent for 2 seconds. Closing WebSocket connection.');
        this.socket.close();
      }
    }, this.inactivityDelay);
  }

  clearInactivityTimer() {
    if (this.inactivityTimeout) {
      clearTimeout(this.inactivityTimeout);
      this.inactivityTimeout = null;
    }
  }

  async sleepSecond(s) {
    await new Promise(resolve => setTimeout(resolve, s * 1000));
  }

  roundNumbers(num_list) {
    if (this.isAllowedFloat) {
      return this.roundTwoDecimals(num_list);
    } else {
      return num_list.map(val => Math.floor(parseFloat(val.toFixed(1))));
    }
  }

  roundTwoDecimals(num_list) {
    return num_list.map(val => parseFloat(val.toFixed(2)));
  }
}

module.exports = Voxelamming;
