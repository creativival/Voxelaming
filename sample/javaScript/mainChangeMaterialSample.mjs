import { Voxelamming } from 'voxelamming';
// import Voxelamming from './voxelamming.js';  // test

let roomName = "1000";
let vox = new Voxelamming(roomName);

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

for (let i = 0; i < colors.length; i++) {
  let color = colors[i];
  vox.createBox(0, i, 0, color[0], color[1], color[2], 1);
}

for (let i = 0; i < 5; i++) {
  vox.changeMaterial(false, 0.25 * i);
  vox.transform(i, 0, 0,  0, 0, 0);
  await vox.sendData();
  await  vox.sleepSecond(0.1)
}

for (let i = 0; i < 5; i++) {
  vox.changeMaterial(true, 0.25 * i);
  vox.transform(5 + i, 0, 0, 0, 0, 0);
  await vox.sendData();
  await  vox.sleepSecond(0.1)
}

