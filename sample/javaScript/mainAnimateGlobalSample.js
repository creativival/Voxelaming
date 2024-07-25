const { BuildBox } = require('voxelamming-node');

(async () => {
  const roomName = "1000";
  const buildBox = new BuildBox(roomName);

  buildBox.setBoxSize(0.3);
  buildBox.setBuildInterval(0.01);

  for (let i = 0; i < 10; i++) {
    buildBox.createBox(-1, i, 0, 0, 1, 1, 1);
    buildBox.createBox(0, i, 0, 1, 0, 0, 1);
    buildBox.createBox(1, i, 0, 1, 1, 0, 1);
    buildBox.createBox(2, i, 0, 0, 1, 1, 1);
  }

  for (let i = 0; i < 5; i++) {
    buildBox.removeBox(0, i * 2 + 1, 0);
    buildBox.removeBox(1, i * 2, 0);
  }

  const node_positions = [
    [0, 0, 0],
    [-10, 0, 0],
    [10, 0, 0],
    [0, -20, 0],
    [0, 20, 0],
    [0, 0, -10],
    [0, 0, 10]
  ];

  for (const [x, y, z] of node_positions) {
    buildBox.translate(x, y, z, 0, 0, 0);
    await buildBox.sendData();
    await buildBox.sleepSecond(1);
  }

  buildBox.animateGlobal(0, 0, 0, 0, 180, 0, 1, 100);
  await buildBox.sendData("mainAnimateGlobalSample");
})().catch(error => {
  console.error(error);
});
