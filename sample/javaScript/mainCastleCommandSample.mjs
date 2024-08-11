import {BuildBox} from 'voxelamming';
// import BuildBox from './buildBox.js';  // test

const roomName = '1000';
const buildBox = new BuildBox(roomName);

buildBox.setCommand('japaneseCastle');

await buildBox.sendData('mainCastleCommandSample');
console.log('send data done');

