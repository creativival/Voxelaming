// import { Voxelamming } from 'voxelamming';
import Voxelamming from './voxelamming.js';  // test

const roomName = '1000';
const voxelamming = new Voxelamming(roomName);

voxelamming.setBoxSize(0.5);
voxelamming.setBuildInterval(0.01);

voxelamming.drawLine(0, 0, 0, 5, 10, 20, 1, 0, 0, 1)

await voxelamming.sendData('mainDrawLineSample');
console.log('send data done')
