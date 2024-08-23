// import { Voxelamming } from 'voxelamming';
import Voxelamming from './voxelamming.js';  // test

const roomName = "1000";
const voxelamming = new Voxelamming(roomName);

voxelamming.setBoxSize(0.3);
voxelamming.setBuildInterval(0.01);

for (let i = 0; i < 10; i++) {
  voxelamming.createBox(-1, i, 0, 0, 1, 1, 1);
  voxelamming.createBox(0, i, 0, 1, 0, 0, 1);
  voxelamming.createBox(1, i, 0, 1, 1, 0, 1);
  voxelamming.createBox(2, i, 0, 0, 1, 1, 1);
}

for (let i = 0; i < 5; i++) {
  voxelamming.removeBox(0, i * 2 + 1, 0);
  voxelamming.removeBox(1, i * 2, 0);
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
  voxelamming.transform(x, y, z, 0, 0, 0);
  await voxelamming.sendData();
  await voxelamming.sleepSecond(0.1);
}

voxelamming.animateGlobal(0, 0, 0, 0, 180, 0, 1, 100);
await voxelamming.sendData("mainAnimateGlobalSample");
console.log('send data done')
