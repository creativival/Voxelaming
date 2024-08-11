import { BuildBox } from 'voxelamming';
// import BuildBox from './buildBox.js';  // test

let roomName = "1000";
let buildBox = new BuildBox(roomName);

buildBox.setBoxSize(1);
buildBox.setBuildInterval(0.01);

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
  buildBox.createBox(0, i, 0, color[0], color[1], color[2], 1);
}

for (let i = 0; i < 5; i++) {
  buildBox.changeMaterial(false, 0.25 * i);
  buildBox.transform(i, 0, 0,  0, 0, 0);
  await buildBox.sendData();
  await  buildBox.sleepSecond(1)
}

for (let i = 0; i < 5; i++) {
  buildBox.changeMaterial(true, 0.25 * i);
  buildBox.transform(5 + i, 0, 0, 0, 0, 0);
  await buildBox.sendData();
  await  buildBox.sleepSecond(1)
}

