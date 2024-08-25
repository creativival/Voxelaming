// import { Voxelamming } from 'voxelamming';
import Voxelamming from './voxelamming.js';  // test

const roomName = '1000';
const vox = new Voxelamming(roomName);

vox.setCommand('japaneseCastle');

await vox.sendData('mainCastleCommandSample');
console.log('send data done');

