import { Voxelamming } from 'voxelamming';
// import Voxelamming from './voxelamming.js';  // test

const roomName = '1000';
const vox = new Voxelamming(roomName);

vox.setBoxSize(0.5);
vox.setBuildInterval(0.01);

for (let i = 0; i < 100; i++) {
  const alpha = (100 - i) / 100
  vox.createBox(-1, i, 0, 0, 1, 1, alpha);
  vox.createBox(0, i, 0, 1, 0, 0, alpha);
  vox.createBox(1, i, 0, 1, 1, 0, alpha);
  vox.createBox(2, i, 0, 0, 1, 1, alpha);
}

for (let i = 0; i < 50; i++) {
  vox.removeBox(0, i * 2, 0);
  vox.removeBox(1, i * 2 + 1, 0);
}

await vox.sendData();
console.log('send data done');
