// import { Voxelamming, getBoxesFromPly } from 'voxelamming';
import { getBoxesFromPly } from 'voxelamming'; // test
import Voxelamming from './voxelamming.js';  // test

const roomName = '1000';
const vox = new Voxelamming(roomName);
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
      vox.createBox(...box);
    });

    vox.setBoxSize(0.5);
    vox.setBuildInterval(0);
    vox.transform(...position);
    await vox.sendData();
    await vox.sleepSecond(0.5)

    await vox.clearData();
    vox.setCommand('reset');
    await vox.sendData();
    await vox.clearData();
    await vox.sleepSecond(0.5)
  }
}
