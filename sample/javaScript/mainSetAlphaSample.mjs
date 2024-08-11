import { BuildBox } from 'voxelamming';
// import BuildBox from './buildBox.js';  // test

const roomName = '1000';
const buildBox = new BuildBox(roomName);

buildBox.setBoxSize(0.5);
buildBox.setBuildInterval(0.01);

for (let i = 0; i < 100; i++) {
  const alpha = (100 - i) / 100
  buildBox.createBox(-1, i, 0, 0, 1, 1, alpha);
  buildBox.createBox(0, i, 0, 1, 0, 0, alpha);
  buildBox.createBox(1, i, 0, 1, 1, 0, alpha);
  buildBox.createBox(2, i, 0, 0, 1, 1, alpha);
}

for (let i = 0; i < 50; i++) {
  buildBox.removeBox(0, i * 2, 0);
  buildBox.removeBox(1, i * 2 + 1, 0);
}

await buildBox.sendData();
console.log('send data done');
