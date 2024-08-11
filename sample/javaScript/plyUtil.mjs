import fs from 'fs';

function getBoxesFromPly(plyFile) {
  const boxPositions = new Set();
  const lines = fs.readFileSync(plyFile, 'utf8');
  const positions = lines
    .replace(/\r\n/g, '\n')
    .trim()
    .split('\n')
    .filter(isIncludedSixNumbers)
    .map(ln => ln.split(' ').map(Number));

  const numberOfFaces = Math.floor(positions.length / 4);
  for (let i = 0; i < numberOfFaces; i++) {
    const vertex1 = positions[i * 4];
    const vertex2 = positions[i * 4 + 1];
    const vertex3 = positions[i * 4 + 2];
    const vertex4 = positions[i * 4 + 3]; // no need
    let x = Math.min(vertex1[0], vertex2[0], vertex3[0]);
    let y = Math.min(vertex1[1], vertex2[1], vertex3[1]);
    let z = Math.min(vertex1[2], vertex2[2], vertex3[2]);
    const r = vertex1[3] / 255;
    const g = vertex1[4] / 255;
    const b = vertex1[5] / 255;
    const alpha = 1
    let step = 0;

    // ボックスを置く方向を解析
    if (vertex1[0] === vertex2[0] && vertex2[0] === vertex3[0]) {
      // y-z plane
      step = Math.max(vertex1[1], vertex2[1], vertex3[1]) - y;
      if (vertex1[1] !== vertex2[1]) {
        x -= step;
      }
    } else if (vertex1[1] === vertex2[1] && vertex2[1] === vertex3[1]) {
      // z-x plane
      step = Math.max(vertex1[2], vertex2[2], vertex3[2]) - z;
      if (vertex1[2] !== vertex2[2]) {
        y -= step;
      }
    } else {
      // x-y plane
      step = Math.max(vertex1[0], vertex2[0], vertex3[0]) - x;
      if (vertex1[0] !== vertex2[0]) {
        z -= step;
      }
    }

    // minimum unit: 0.1
    const positionX = Math.floor(Math.round((x * 10) / step) / 10);
    const positionY = Math.floor(Math.round((y * 10) / step) / 10);
    const positionZ = Math.floor(Math.round((z * 10) / step) / 10);
    boxPositions.add([positionX, positionZ, -positionY, r, g, b, alpha]);
  }

  return [...boxPositions];
}

function isIncludedSixNumbers(line) {
  const lineList = line.split(' ');
  if (lineList.length !== 6) {
    return false;
  }
  for (let i = 0; i < 6; i++) {
    if (isNaN(parseFloat(lineList[i]))) {
      return false;
    }
  }
  return true;
}

modulte.exports = getBoxesFromPly;
