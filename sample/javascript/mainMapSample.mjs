import BuildBox from './buildBox.mjs';
import { getMapDataFromCSV, getBoxColor } from './mapUtil.mjs';

(async () => {
  const roomName = "1000";
  const buildBox = new BuildBox(roomName);

  buildBox.setBoxSize(0.1);
  buildBox.setBuildInterval(0.001);

  const columnNum = 257;
  const rowNum = 257;
  const csvFile = 'map_38_138_100km.csv';
  const heightScale = 100;
  const highColor = [0.5, 0, 0];
  const lowColor = [0, 1, 0];
  const mapData = getMapDataFromCSV(csvFile, heightScale);
  const boxes = mapData.boxes;
  const maxHeight = mapData.maxHeight;
  // const skip = 1;  // high power device
  const skip = 2;  // normal device
  // const skip = 4;  // low power device

  for (let j = 0; j < rowNum / skip; j++) {
    for (let i = 0; i < columnNum / skip; i++) {
      const x = i;
      const z = j;
      const y = boxes[j * skip][i * skip];
      const [r, g, b] = getBoxColor(y, maxHeight, highColor, lowColor);

      if (y >= 0) {
        buildBox.createBox(x, y, z, r, g, b, 1);
      }
    }
  }

  await buildBox.sendData();
})().catch(error => {
  console.error(error);
});
