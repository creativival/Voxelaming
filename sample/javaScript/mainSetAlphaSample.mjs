// import { Voxelamming } from 'voxelamming';
import Voxelamming from './voxelamming.js';  // test

const roomName = '1000';
const voxelamming = new Voxelamming(roomName);

voxelamming.setBoxSize(0.5);
voxelamming.setBuildInterval(0.01);

for (let i = 0; i < 100; i++) {
  const alpha = (100 - i) / 100
  voxelamming.createBox(-1, i, 0, 0, 1, 1, alpha);
  voxelamming.createBox(0, i, 0, 1, 0, 0, alpha);
  voxelamming.createBox(1, i, 0, 1, 1, 0, alpha);
  voxelamming.createBox(2, i, 0, 0, 1, 1, alpha);
}

for (let i = 0; i < 50; i++) {
  voxelamming.removeBox(0, i * 2, 0);
  voxelamming.removeBox(1, i * 2 + 1, 0);
}

await voxelamming.sendData();
console.log('send data done');
