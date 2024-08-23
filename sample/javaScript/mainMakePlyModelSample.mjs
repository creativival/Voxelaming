// import { Voxelamming, getBoxesFromPly } from 'voxelamming';
import { getBoxesFromPly } from 'voxelamming'; // test
import Voxelamming from './voxelamming.js';  // test

const roomName = '1000';
const voxelamming = new Voxelamming(roomName);

voxelamming.setBoxSize(0.5);
voxelamming.setBuildInterval(0.01);

const plyFileName = '../ply_file/piyo.ply'

const boxes = getBoxesFromPly(plyFileName)

for (const box of boxes) {
  // console.log(b)
  voxelamming.createBox(...box)
}

await voxelamming.sendData();
console.log('send data done');
