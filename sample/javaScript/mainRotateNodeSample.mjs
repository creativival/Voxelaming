// import { Voxelamming } from 'voxelamming';
import Voxelamming from './voxelamming.js';  // test

const rotations = [
  [0, 0, 0],
  [30, 0, 0],
  [0, 30, 0],
  [0, 0, 30],
]

const roomName = '1000';
const voxelamming = new Voxelamming(roomName);

voxelamming.setBoxSize(0.5);
voxelamming.setBuildInterval(0.01);

for (let i = 0; i < 10; i++) {
  voxelamming.createBox(-1, i, 0, 0, 1, 1);
  voxelamming.createBox(0, i, 0, 1, 0, 0);
  voxelamming.createBox(1, i, 0, 1, 1, 0);
  voxelamming.createBox(2, i, 0, 0, 1, 1);
}

for (let i = 0; i < 5; i++) {
  voxelamming.removeBox(0, i * 2, 0);
  voxelamming.removeBox(1, i * 2 + 1, 0);
}

for (let i = 0; i < rotations.length; i++) {
  const rotation = rotations[i]
  const pitch = rotation[0]
  const yaw = rotation[1]
  const roll = rotation[2]

  voxelamming.transform(0, 0, 0, pitch, yaw, roll)
  await voxelamming.sendData()
  await voxelamming.sleepSecond(0.1)
  console.log('send data done')
}
