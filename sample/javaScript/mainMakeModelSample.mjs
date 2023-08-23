import BuildBox from './buildBox.mjs';
import { getBoxesFromPly } from './plyUtil.mjs';

(async () => {
  const roomName = '1000';
  const buildBox = new BuildBox(roomName);

  buildBox.setBoxSize(0.5);
  buildBox.setBuildInterval(0.01);

  const plyFileName = 'piyo.ply'

  const boxes = getBoxesFromPly(plyFileName)

  for (const box of boxes) {
    // console.log(b)
    buildBox.createBox(...box)
  }

  await buildBox.sendData();
  console.log('send data done')
})().catch(error => {
  console.error(error);
});
