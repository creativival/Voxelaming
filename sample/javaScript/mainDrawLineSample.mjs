// import { Voxelamming } from 'voxelamming';
import Voxelamming from './voxelamming.js';  // test

const roomName = '1000';
const vox = new Voxelamming(roomName);

vox.setBoxSize(0.5);
vox.setBuildInterval(0.01);

vox.drawLine(0, 0, 0, 5, 10, 20, 1, 0, 0, 1)

await vox.sendData('mainDrawLineSample');
console.log('send data done')
