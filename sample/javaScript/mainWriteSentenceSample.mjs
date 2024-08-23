// import { Voxelamming } from 'voxelamming';
import Voxelamming from './voxelamming.js';  // test

const roomName = '1000';
const voxelamming = new Voxelamming(roomName);

voxelamming.setBoxSize(0.5);
voxelamming.setBuildInterval(0.01);

voxelamming.writeSentence('Voxel', 0, 130, 0, 1, 0, 1, 1, 24)
voxelamming.writeSentence('Voxel', 0, 106, 0, 1, 0, 1, 1, 24, true);
voxelamming.writeSentence('Hello, world', 0, 90, 0, 1, 0, 0, 1, 16);
voxelamming.writeSentence('Hello, world', 0, 64, 0, 1, 0, 0, 1, 16, true);
voxelamming.writeSentence('こんにちは', 0, 48, 0, 0, 1, 0, 1, 12);
voxelamming.writeSentence('こんにちは', 0, 32, 0, 0, 1, 0, 1, 12, true);
voxelamming.writeSentence('今日は', 0, 16, 0, 0, 0, 1, 1, 8);
voxelamming.writeSentence('今日は', 0, 0, 0, 0, 0, 1, 1, 8, true);
await voxelamming.sendData();
console.log('send data done')
