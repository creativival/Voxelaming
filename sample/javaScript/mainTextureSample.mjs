// import { Voxelamming } from 'voxelamming';
import Voxelamming from './voxelamming.js';  // test

const textureNames = ["grass", "stone", "dirt", "planks", "bricks"];
const roomName = "1000";
const voxelamming = new Voxelamming(roomName);

voxelamming.setBoxSize(1);
voxelamming.setBuildInterval(0.01);

textureNames.forEach((texture, i) => {
  voxelamming.createBox(0, textureNames.length - i - 1, 0, 0, 0, 0, 1, texture);
});

await voxelamming.sendData();
await voxelamming.clearData();
await voxelamming.sleepSecond(0.1)

voxelamming.setBoxSize(1);
voxelamming.setBuildInterval(0.01);
voxelamming.changeShape('sphere');
textureNames.forEach((texture, i) => {
  voxelamming.createBox(1, textureNames.length - i - 1, 0, 0, 0, 0, 1, texture);
});

await voxelamming.sendData();
await voxelamming.clearData();
await voxelamming.sleepSecond(0.1)

voxelamming.setBoxSize(1);
voxelamming.setBuildInterval(0.01);
voxelamming.changeShape('plane');
textureNames.forEach((texture, i) => {
  voxelamming.createBox(2, textureNames.length - i - 1, 0, 0, 0, 0, 1, texture);
});

await voxelamming.sendData();
await voxelamming.clearData();
console.log('send data done');
