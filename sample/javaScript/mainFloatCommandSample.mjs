// import { Voxelamming } from 'voxelamming';
import Voxelamming from './voxelamming.js';  // test

const roomName = "1000";
const size = 1.0;
const radius = 1.5;
const repeatCount = 100;

const voxelamming = new Voxelamming(roomName);
voxelamming.setBuildInterval(0.01);
voxelamming.setBoxSize(size);
voxelamming.changeShape("sphere");
voxelamming.setCommand('float');

for (let i = 0; i < repeatCount; i++) {
  const angle = (i * 720 / repeatCount) * (Math.PI / 180);
  const x = radius * Math.cos(angle);
  const y = i;
  const z = radius * Math.sin(angle);

  voxelamming.createBox(x, y, z, 0, 1, 1, 1);
  voxelamming.createBox(-x, y, -z, 0, 1, 1, 1);
  if (i % 2 === 0) {
    voxelamming.createBox(x / 3, y, z / 3, 1, 0, 0, 1);
  } else {
    voxelamming.createBox(-x / 3, y, -z / 3, 1, 1, 0, 1);
  }
}

await voxelamming.sendData('floatCommand');
console.log('send data done');
