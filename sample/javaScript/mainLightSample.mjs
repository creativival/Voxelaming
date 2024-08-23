// import { Voxelamming } from 'voxelamming';
import Voxelamming from './voxelamming.js';  // test

let roomName = "1000";
let voxelamming = new Voxelamming(roomName);

voxelamming.setCommand('axis');
voxelamming.setBoxSize(1);
voxelamming.setBuildInterval(0.01);

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
  voxelamming.createBox(0, i, 0, color[0], color[1], color[2], 1);
}

voxelamming.setLight(1, 1, 0, 1, 0, 0, 1, 20000, 2, 'directional');
voxelamming.setLight(0, 1, 1, 0, 1, 0, 1, 20000, 3, 'spot');
voxelamming.setLight(-1, 1, 0, 0, 0, 1, 1, 20000, 5, 'point');

await voxelamming.sendData();
console.log('send data done');
