import BuildBox from './buildBox.mjs';
import { getBoxesFromPly } from './plyUtil.mjs';

(async () => {
  const roomName = '1000';
  const buildBox = new BuildBox(roomName);
  const animationSettings = [
    {
      model: 'frog1.ply',
      position: [0, 0, 0, 0, 0, 0],
    },
    {
      model: 'frog2.ply',
      position: [0, 0, 0, 0, 0, 0],
    },
    {
      model: 'frog3.ply',
      position: [0, 0, 0, 0, 0, 0],
    },
    {
      model: 'frog4.ply',
      position: [0, 5, 0, 0, 0, 0],
    },
    {
      model: 'frog5.ply',
      position: [0, 10, 0, 0, 0, 0],
    },
    {
      model: 'frog4.ply',
      position: [0, 5, 0, 0, 0, 0],
    },
    {
      model: 'frog3.ply',
      position: [0, 0, 0, 0, 0, 0],
    },
    {
      model: 'frog2.ply',
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
      buildBox.setNode(...position);
      await buildBox.sendData();
      await buildBox.sleepSecond(0.5)

      buildBox.setCommand('reset');
      await buildBox.sendData();
      buildBox.clearData();
      await buildBox.sleepSecond(0.5)
    }
  }
})().catch(error => {
  console.error(error);
});
