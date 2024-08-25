// import { Voxelamming } from 'voxelamming';
import Voxelamming from './voxelamming.js';  // test

let roomName = "1000";
let vox = new Voxelamming(roomName);

vox.setCommand('axis');
vox.setBoxSize(1);
vox.setBuildInterval(0.01);

let colors = [
  [0, 0, 0],
  [1, 0, 0],
  [0, 1, 0],
  [0, 0, 1],
  [1, 1, 0],
  [1, 0, 1],
  [0, 1, 1],
  [1, 1, 1],
  [0.5, 0.5, 0.5],
  [0.5, 0, 0],
  [0, 0.5, 0],
  [0, 0, 0.5],
  [0.5, 0.5, 0],
  [0.5, 0, 0.5],
  [0, 0.5, 0.5],
];

for(let i = 0; i < colors.length; i++){
  let color = colors[i];
  vox.createBox(0, i, 0, color[0], color[1], color[2], 1);
}

vox.setLight(1, 1, 0, 1, 0, 0, 1, 20000, 2, 'directional');
vox.setLight(0, 1, 1, 0, 1, 0, 1, 20000, 3, 'spot');
vox.setLight(-1, 1, 0, 0, 0, 1, 1, 20000, 5, 'point');

await vox.sendData();
console.log('send data done');
