import { Voxelamming, getBoxesFromPly } from 'voxelamming';
// import { getBoxesFromPly } from 'voxelamming'; // test
// import Voxelamming from './voxelamming.js';  // test

const roomName = '1000';
const vox = new Voxelamming(roomName);

vox.setBoxSize(0.5);
vox.setBuildInterval(0.01);

const plyFileName = '../ply_file/piyo.ply'

const boxes = getBoxesFromPly(plyFileName)

for (const box of boxes) {
  // console.log(b)
  vox.createBox(...box)
}

await vox.sendData();
console.log('send data done');
