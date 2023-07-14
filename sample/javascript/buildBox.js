const WebSocket = require('ws');

class BuildBox {
  constructor(roomName) {
    this.roomName = roomName;
    this.node = [0, 0, 0, 0, 0, 0]
    this.animation = [0, 0, 0, 0, 0, 0, 1, 0]
    this.boxes = [];
    this.sentences = []
    this.size = 1.0;
    this.buildInterval = 0.01;
  }

  setNode(x, y, z, pitch=0, yaw=0, roll=0) {
    x = Math.floor(x);
    y = Math.floor(y);
    z = Math.floor(z);
    this.node = [x, y, z, pitch, yaw, roll]
  }

  animationNode(x, y, z, pitch=0, yaw=0, roll=0, scale=1, interval=10) {
    x = Math.floor(x);
    y = Math.floor(y);
    z = Math.floor(z);
    this.animation = [x, y, z, pitch, yaw, roll, scale, interval]
  }

  createBox(x, y, z, r=1, g=1, b=1, alpha=1) {
    x = Math.floor(x);
    y = Math.floor(y);
    z = Math.floor(z);
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
    this.boxes = [];
    this.size = 1.0;
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
    self.sentences.append([sentence, x, y, z, r, g, b, alpha])
  }

  // sendData() {
  //   console.log('Sending data...');
  //   let date = new Date();
  //   let dataToSend = {
  //     node: this.node,
  //     animation: this.animation,
  //     boxes: this.boxes,
  //     sentences: this.sentences,
  //     size: this.size,
  //     interval: this.buildInterval,
  //     date: date.toISOString()
  //   };
  //
  //   this.ws.on('open', () => {
  //     this.ws.send(this.roomName);
  //     console.log(`Joined room: ${this.roomName}`);
  //     this.ws.send(JSON.stringify(dataToSend));
  //
  //     // Close the WebSocket connection after sending data
  //     this.ws.close();
  //   });
  // }

  async sendData() {
    console.log('Sending data...');
    const ws = new WebSocket('wss://render-nodejs-server.onrender.com');
    const date = new Date();
    const dataToSend = {
      node: this.node,
      animation: this.animation,
      boxes: this.boxes,
      sentences: this.sentences,
      size: this.size,
      interval: this.buildInterval,
      date: date.toISOString()
    };

    try {
      await new Promise((resolve, reject) => {  ws.onopen = () => {
        ws.send(this.roomName);
        console.log(`Joined room: ${this.roomName}`);
        ws.send(JSON.stringify(dataToSend));
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

module.exports = BuildBox;
