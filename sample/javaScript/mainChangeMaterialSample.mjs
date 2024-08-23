// import { Voxelamming } from 'voxelamming';
import Voxelamming from './voxelamming.js';  // test

let roomName = "1000";
let voxelamming = new Voxelamming(roomName);

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

for (let i = 0; i < colors.length; i++) {
  let color = colors[i];
  voxelamming.createBox(0, i, 0, color[0], color[1], color[2], 1);
}

for (let i = 0; i < 5; i++) {
  voxelamming.changeMaterial(false, 0.25 * i);
  voxelamming.transform(i, 0, 0,  0, 0, 0);
  await voxelamming.sendData();
  await  voxelamming.sleepSecond(0.1)
}

for (let i = 0; i < 5; i++) {
  voxelamming.changeMaterial(true, 0.25 * i);
  voxelamming.transform(5 + i, 0, 0, 0, 0, 0);
  await voxelamming.sendData();
  await  voxelamming.sleepSecond(0.1)
}

