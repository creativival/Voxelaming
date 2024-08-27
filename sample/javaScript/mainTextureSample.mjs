import { Voxelamming } from 'voxelamming';
// import Voxelamming from './voxelamming.js';  // test

const textureNames = ["grass", "stone", "dirt", "planks", "bricks"];
const roomName = "1000";
const vox = new Voxelamming(roomName);

vox.setBoxSize(1);
vox.setBuildInterval(0.01);

textureNames.forEach((texture, i) => {
  vox.createBox(0, textureNames.length - i - 1, 0, 0, 0, 0, 1, texture);
});

await vox.sendData();
await vox.clearData();
await vox.sleepSecond(0.1)

vox.setBoxSize(1);
vox.setBuildInterval(0.01);
vox.changeShape('sphere');
textureNames.forEach((texture, i) => {
  vox.createBox(1, textureNames.length - i - 1, 0, 0, 0, 0, 1, texture);
});

await vox.sendData();
await vox.clearData();
await vox.sleepSecond(0.1)

vox.setBoxSize(1);
vox.setBuildInterval(0.01);
vox.changeShape('plane');
textureNames.forEach((texture, i) => {
  vox.createBox(2, textureNames.length - i - 1, 0, 0, 0, 0, 1, texture);
});

await vox.sendData();
await vox.clearData();
console.log('send data done');
