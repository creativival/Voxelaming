import { BuildBox } from 'voxelamming';
// import BuildBox from './buildBox.js';  // test

const roomName = '1000';
const buildBox = new BuildBox(roomName);

buildBox.setBoxSize(0.5);
buildBox.setBuildInterval(0.01);

buildBox.drawLine(0, 0, 0, 5, 10, 20, 1, 0, 0, 1)

await buildBox.sendData('mainDrawLineSample');
console.log('send data done')
