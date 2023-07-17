import fs from 'fs';

const columnNum = 257;
const rowNum = 257;

export function getMapDataFromCSV(csvFile, heightScale) {
  const data = fs.readFileSync(`../map_file/${csvFile}`, 'utf8');
  const lines = data.split('\n');

  const heights = lines[0].split(',').map(h => {
    if (h !== '0') {
      return Math.floor(parseFloat(h) * heightScale);
    } else {
      return -1;
    }
  });

  const maxHeight = Math.floor(Math.max(...heights));
  console.log('max', maxHeight);

  const boxPositions = [];
  for (let i = 0; i < rowNum; i++) {
    const row = [];
    for (let j = 0; j < columnNum; j++) {
      const index = j + columnNum * i;
      row.push(heights[index]);
    }
    boxPositions.push(row);
  }

  const mapData = { boxes: boxPositions, maxHeight: maxHeight };
  return mapData;
}

export function getBoxColor(height, maxHeight, highColor, lowColor) {
  const r = (highColor[0] - lowColor[0]) * height / maxHeight + lowColor[0];
  const g = (highColor[1] - lowColor[1]) * height / maxHeight + lowColor[1];
  const b = (highColor[2] - lowColor[2]) * height / maxHeight + lowColor[2];

  return [r, g, b];
}
