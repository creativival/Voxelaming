import { Voxelamming, Turtle } from 'voxelamming';
// import {Turtle} from 'voxelamming'; // test
// import Voxelamming from './voxelamming.js';  // test

const roomName = "1000";
const vox = new Voxelamming(roomName);

vox.setBoxSize(0.3);
vox.setBuildInterval(0.01);
vox.setCommand('liteRender')
const t = new Turtle(vox);

const colors = [
  [0, 0, 0, 1],
  [1, 0, 0, 1],
  [0, 1, 0, 1],
  [0, 0, 1, 1],
  [1, 1, 0, 1],
  [0, 1, 1, 1],
  [1, 0, 1, 1],
  [1, 1, 1, 1],
  [0.5, 0, 0, 1],
  [0, 0.5, 0, 1],
  [0, 0, 0.5, 1],
  [0.5, 0.5, 0, 1],
  [0, 0.5, 0.5, 1],
  [0.5, 0, 0.5, 1],
  [0.5, 0.5, 0.5, 1],
];

for (let j = 0; j < colors.length; j++) {
  const color = colors[j];
  const polarPhi = (j * 180) / colors.length;
  t.reset();
  t.setColor(...color);
  t.left(polarPhi);

  for (let i = 0; i < 60; i++) {
    t.forward(4);
    t.up(6);
  }
}

await vox.sendData();
console.log('send data done');
