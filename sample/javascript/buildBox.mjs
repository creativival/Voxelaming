import WebSocket from 'ws';

class BuildBox {
  constructor(roomName) {
    this.roomName = roomName;
    this.globalAnimation = [0, 0, 0, 0, 0, 0, 1, 0]
    this.node = [0, 0, 0, 0, 0, 0]
    this.animation = [0, 0, 0, 0, 0, 0, 1, 0]
    this.boxes = [];
    this.sentence = []
    this.lights = [];
    this.commands = []
    this.size = 1.0;
    this.shape = 'box'
    this.buildInterval = 0.01;
  }

  animateGlobal(x, y, z, pitch = 0, yaw = 0, roll = 0, scale = 1, interval = 10) {
    this.clearData();
    x = Math.floor(x);
    y = Math.floor(y);
    z = Math.floor(z);
    this.globalAnimation = [x, y, z, pitch, yaw, roll, scale, interval];
  }

  setNode(x, y, z, pitch=0, yaw=0, roll=0) {
    x = Math.floor(x);
    y = Math.floor(y);
    z = Math.floor(z);
    this.node = [x, y, z, pitch, yaw, roll]
  }

  animateNode(x, y, z, pitch=0, yaw=0, roll=0, scale=1, interval=10) {
    x = Math.floor(x);
    y = Math.floor(y);
    z = Math.floor(z);
    this.animation = [x, y, z, pitch, yaw, roll, scale, interval]
  }

  createBox(x, y, z, r=1, g=1, b=1, alpha=1) {
    x = Math.floor(x);
    y = Math.floor(y);
    z = Math.floor(z);
    // 重ねて置くことを防止するために、同じ座標の箱があれば削除する
    this.removeBox(x, y, z);
    this.boxes.push([x, y, z, r, g, b, alpha]);
  }

  removeBox(x, y, z) {
    x = Math.floor(x);
    y = Math.floor(y);
    z = Math.floor(z);
    for (let i = 0; i < this.boxes.length; i++) {
      let box = this.boxes[i];
      if (box[0] === x && box[1] === y && box[2] === z) {
        this.boxes.splice(i, 1);
        break;
      }
    }
  }

  setBoxSize(boxSize) {
    this.size = boxSize;
  }

  setBuildInterval(interval) {
    this.buildInterval = interval;
  }

  clearData() {
    this.globalAnimation = [0, 0, 0, 0, 0, 0, 1, 0]
    this.node = [0, 0, 0, 0, 0, 0]
    this.animation = [0, 0, 0, 0, 0, 0, 1, 0]
    this.boxes = [];
    this.sentence = []
    this.lights = [];
    this.commands = []
    this.size = 1.0;
    this.shape = 'box'
    this.buildInterval = 0.01;
  }

  writeSentence(sentence, x, y, z, r=1, g=1, b=1, alpha=1) {
    x = String(Math.floor(x));
    y = String(Math.floor(y));
    z = String(Math.floor(z));
    r = String(r);
    g = String(g);
    b = String(b);
    alpha = String(alpha);
    this.sentence = [sentence, x, y, z, r, g, b, alpha];
  }

  setLight(x, y, z, r=1, g=1, b=1, alpha=1, intensity=1000, interval=1) {
    x = Math.floor(x);
    y = Math.floor(y);
    z = Math.floor(z);
    this.lights.push([x, y, z, r, g, b, alpha, intensity, interval]);
  }

  setCommand(command) {
    this.commands.push(command);
  }

  drawLine(x1, y1, z1, x2, y2, z2, r = 1, g = 1, b = 1, alpha = 1) {
    x1 = Math.floor(x1);
    y1 = Math.floor(y1);
    z1 = Math.floor(z1);
    x2 = Math.floor(x2);
    y2 = Math.floor(y2);
    z2 = Math.floor(z2);
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

  async sendData() {
    console.log('Sending data...');
    const ws = new WebSocket('wss://websocket.voxelamming.com');
    const date = new Date();
    const dataToSend = {
      globalAnimation: this.globalAnimation,
      node: this.node,
      animation: this.animation,
      boxes: this.boxes,
      sentence: this.sentence,
      lights: this.lights,
      commands: this.commands,
      size: this.size,
      shape: this.shape,
      interval: this.buildInterval,
      date: date.toISOString()
    };

    try {
      await new Promise((resolve, reject) => {  ws.onopen = () => {
          ws.send(this.roomName);
          console.log(`Joined room: ${this.roomName}`);
          ws.send(JSON.stringify(dataToSend));
          console.log(dataToSend)
          console.log('Sent data to server');
          setTimeout(() => {
            ws.close();
            resolve();
          }, 1000); // 適切な時間を指定して自動的に接続を閉じる
        };

        ws.onerror = error => {
          console.error(`WebSocket error: ${error}`);
          reject(error);
        };
      });
    } catch (error) {
      console.error(`WebSocket connection failed: ${error}`);
    }
  }


  async sleepSecond(s) {
    await new Promise(resolve => setTimeout(resolve, s * 1000));
  }
}

export default BuildBox;
