import { Voxelamming } from 'voxelamming';
// import Voxelamming from './voxelamming.js';  // test

const rotations = [
  [0, 0, 0],
  [30, 0, 0],
  [0, 30, 0],
  [0, 0, 30],
]

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

for (let i = 0; i < rotations.length; i++) {
  const rotation = rotations[i]
  const pitch = rotation[0]
  const yaw = rotation[1]
  const roll = rotation[2]

  vox.transform(0, 0, 0, pitch, yaw, roll)
  await vox.sendData()
  await vox.sleepSecond(0.1)
  console.log('send data done')
}
