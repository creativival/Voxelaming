// import { Voxelamming } from 'voxelamming';
import Voxelamming from './voxelamming.js';  // test

const roomName = "1000";
const vox = new Voxelamming(roomName);

vox.setBoxSize(0.3);
vox.setBuildInterval(0.01);

for (let i = 0; i < 10; i++) {
  vox.createBox(-1, i, 0, 0, 1, 1, 1);
  vox.createBox(0, i, 0, 1, 0, 0, 1);
  vox.createBox(1, i, 0, 1, 1, 0, 1);
  vox.createBox(2, i, 0, 0, 1, 1, 1);
}

for (let i = 0; i < 5; i++) {
  vox.removeBox(0, i * 2 + 1, 0);
  vox.removeBox(1, i * 2, 0);
}

const node_positions = [
  [0, 0, 0],
  [-10, 0, 0],
  [10, 0, 0],
  [0, -20, 0],
  [0, 20, 0],
  [0, 0, -10],
  [0, 0, 10]
];

for (const [x, y, z] of node_positions) {
  vox.transform(x, y, z, 0, 0, 0);
  await vox.sendData();
  await vox.sleepSecond(0.1);
}

vox.animateGlobal(0, 0, 0, 0, 180, 0, 1, 100);
await vox.sendData("mainAnimateGlobalSample");
console.log('send data done')
