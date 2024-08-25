// import { Voxelamming } from 'voxelamming';
import Voxelamming from './voxelamming.js';  // test

const roomName = '1000';
const vox = new Voxelamming(roomName);

const radius = 20;

vox.setBoxSize(0.5);
vox.setBuildInterval(0.01);
vox.transform(0, radius, 0, 0, 0, 0)

for (let i = -radius; i <= radius; i++) {
  for (let j = -radius; j <= radius; j++) {
    for (let k = -radius; k <= radius; k++) {
      if ((i ** 2 + j ** 2 + k ** 2 < radius ** 2) && (i ** 2 + j ** 2 + k ** 2 >= (radius - 1) ** 2)) {
        console.log(i, j, k)
        vox.createBox(i, j, k, 0, 1, 1)
      }
    }
  }
}

await vox.sendData();
console.log('send data done');
