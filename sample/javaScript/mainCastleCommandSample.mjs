// import { Voxelamming } from 'voxelamming';
import Voxelamming from './voxelamming.js';  // test

const roomName = '1000';
const voxelamming = new Voxelamming(roomName);

voxelamming.setCommand('japaneseCastle');

await voxelamming.sendData('mainCastleCommandSample');
console.log('send data done');

