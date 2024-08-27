import { Voxelamming } from 'voxelamming';
// import Voxelamming from './voxelamming.js';  // test

const roomName = '1000';
const vox = new Voxelamming(roomName);

vox.setBoxSize(0.5);
vox.setBuildInterval(0.01);

vox.writeSentence('Voxel', 0, 130, 0, 1, 0, 1, 1, 24)
vox.writeSentence('Voxel', 0, 106, 0, 1, 0, 1, 1, 24, true);
vox.writeSentence('Hello, world', 0, 90, 0, 1, 0, 0, 1, 16);
vox.writeSentence('Hello, world', 0, 64, 0, 1, 0, 0, 1, 16, true);
vox.writeSentence('こんにちは', 0, 48, 0, 0, 1, 0, 1, 12);
vox.writeSentence('こんにちは', 0, 32, 0, 0, 1, 0, 1, 12, true);
vox.writeSentence('今日は', 0, 16, 0, 0, 0, 1, 1, 8);
vox.writeSentence('今日は', 0, 0, 0, 0, 0, 1, 1, 8, true);
await vox.sendData();
console.log('send data done')
