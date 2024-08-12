import { BuildBox, getBoxesFromPly } from 'voxelamming';
// import BuildBox from './buildBox.js';  // test

const roomName = '1000';
const buildBox = new BuildBox(roomName);

buildBox.setBoxSize(0.5);
buildBox.setBuildInterval(0.01);

const plyFileName = '../ply_file/piyo.ply'

const boxes = getBoxesFromPly(plyFileName)

for (const box of boxes) {
  // console.log(b)
  buildBox.createBox(...box)
}

await buildBox.sendData();
console.log('send data done');
