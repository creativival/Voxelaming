import { BuildBox } from 'voxelamming';
// import BuildBox from './buildBox.js';  // test

let roomName = "1000";
let buildBox = new BuildBox(roomName);

buildBox.setCommand('axis');
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

for(let i = 0; i < colors.length; i++){
  let color = colors[i];
  buildBox.createBox(0, i, 0, color[0], color[1], color[2], 1);
}

buildBox.setLight(1, 1, 0, 1, 0, 0, 1, 20000, 2, 'directional');
buildBox.setLight(0, 1, 1, 0, 1, 0, 1, 20000, 3, 'spot');
buildBox.setLight(-1, 1, 0, 0, 0, 1, 1, 20000, 5, 'point');

await buildBox.sendData();
console.log('send data done');
