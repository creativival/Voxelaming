import { BuildBox, getBoxesFromPly } from 'voxelamming';
// import BuildBox from './buildBox.js';  // test

const roomName = '1000';
const buildBox = new BuildBox(roomName);
const animationSettings = [
  {
    model: '../ply_file/frog1.ply',
    position: [0, 0, 0, 0, 0, 0],
  },
  {
    model: '../ply_file/frog2.ply',
    position: [0, 0, 0, 0, 0, 0],
  },
  {
    model: '../ply_file/frog3.ply',
    position: [0, 0, 0, 0, 0, 0],
  },
  {
    model: '../ply_file/frog4.ply',
    position: [0, 5, 0, 0, 0, 0],
  },
  {
    model: '../ply_file/frog5.ply',
    position: [0, 10, 0, 0, 0, 0],
  },
  {
    model: '../ply_file/frog4.ply',
    position: [0, 5, 0, 0, 0, 0],
  },
  {
    model: '../ply_file/frog3.ply',
    position: [0, 0, 0, 0, 0, 0],
  },
  {
    model: '../ply_file/frog2.ply',
    position: [0, 0, 0, 0, 0, 0],
  },
]


for (let _ = 0; _ < 3; _++) {
  for (let i = 0; i < animationSettings.length; i++) {
    let model = animationSettings[i].model;
    let position = animationSettings[i].position;

    let boxes = getBoxesFromPly(model);
    boxes.forEach(box => {
      buildBox.createBox(...box);
    });

    buildBox.setBoxSize(0.5);
    buildBox.setBuildInterval(0);
    buildBox.transform(...position);
    await buildBox.sendData();
    await buildBox.sleepSecond(0.5)

    buildBox.clearData();
    buildBox.setCommand('reset');
    await buildBox.sendData();
    buildBox.clearData();
    await buildBox.sleepSecond(0.5)
  }
}
