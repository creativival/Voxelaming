import { Voxelamming } from 'voxelamming';
// import Voxelamming from './voxelamming.js';  // test

const roomName = '1000';
const vox = new Voxelamming(roomName);

vox.setBoxSize(0.5);
vox.setBuildInterval(0.01);

for (let i = 0; i < 10; i++) {
  vox.createBox(-1, i, 0, 0, 1, 1);
  vox.createBox(0, i, 0, 1, 0, 0);
  vox.createBox(1, i, 0, 1, 1, 0);
  vox.createBox(2, i, 0, 0, 1, 1);
}

for (let i = 0; i < 5; i++) {
  vox.removeBox(0, i * 2, 0);
  vox.removeBox(1, i * 2 + 1, 0);
}

await vox.sendData();

await vox.sleepSecond(0.1)

vox.transform( 10, 0, 0, 0, 0, 0)
vox.changeShape('sphere')
await vox.sendData();

await vox.sleepSecond(0.1)

vox.transform( 20, 0, 0, 0, 0, 0)
vox.changeShape('plane')
await vox.sendData();

console.log('send data done');

