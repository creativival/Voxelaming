// import { Voxelamming } from 'voxelamming';
import Voxelamming from './voxelamming.js';  // test

const roomName = "1000";
const size = 1.0;
const radius = 1.5;
const repeatCount = 100;

const vox = new Voxelamming(roomName);
vox.setBuildInterval(0.01);
vox.setBoxSize(size);
vox.changeShape("sphere");
vox.setCommand('float');

for (let i = 0; i < repeatCount; i++) {
  const angle = (i * 720 / repeatCount) * (Math.PI / 180);
  const x = radius * Math.cos(angle);
  const y = i;
  const z = radius * Math.sin(angle);

  vox.createBox(x, y, z, 0, 1, 1, 1);
  vox.createBox(-x, y, -z, 0, 1, 1, 1);
  if (i % 2 === 0) {
    vox.createBox(x / 3, y, z / 3, 1, 0, 0, 1);
  } else {
    vox.createBox(-x / 3, y, -z / 3, 1, 1, 0, 1);
  }
}

await vox.sendData('floatCommand');
console.log('send data done');
