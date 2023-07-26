import BuildBox from './buildBox.mjs';

(async () => {
  const roomName = '1000';
  const buildBox = new BuildBox(roomName);

  buildBox.setBoxSize(0.5);
  buildBox.setBuildInterval(0.01);

  for (let i = 0; i < 10; i++) {
    buildBox.createBox(-1, i, 0, 0, 1, 1);
    buildBox.createBox(0, i, 0, 1, 0, 0);
    buildBox.createBox(1, i, 0, 1, 1, 0);
    buildBox.createBox(2, i, 0, 0, 1, 1);
  }

  for (let i = 0; i < 5; i++) {
    buildBox.removeBox(0, i * 2, 0);
    buildBox.removeBox(1, i * 2 + 1, 0);
  }

  await buildBox.sendData();

  await buildBox.sleepSecond(1)

  buildBox.animateNode(10, 0, 0, 0, 30, 0, 2, 10)
  buildBox.sendData()

})().catch(error => {
  console.error(error);
});
