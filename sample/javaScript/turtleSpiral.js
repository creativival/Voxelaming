const { BuildBox, Turtle } = require('voxelamming-node');

(async () => {
  const roomName = "1000";
  const buildBox = new BuildBox(roomName);

  buildBox.setBoxSize(0.3);
  buildBox.setBuildInterval(0.001);
  buildBox.setCommand('liteRender')
  const t = new Turtle(buildBox);

  const colors = [
    [0, 0, 0, 1],
    [1, 0, 0, 1],
    [0, 1, 0, 1],
    [0, 0, 1, 1],
    [1, 1, 0, 1],
    [0, 1, 1, 1],
    [1, 0, 1, 1],
    // [1, 1, 1, 1],
    // [0.5, 0, 0, 1],
    // [0, 0.5, 0, 1],
    // [0, 0, 0.5, 1],
    // [0.5, 0.5, 0, 1],
    // [0, 0.5, 0.5, 1],
    // [0.5, 0, 0.5, 1],
    // [0.5, 0.5, 0.5, 1],
  ];

  for (let i = 0; i < colors.length; i++) {
    const color = colors[i];
    const polarPhi = (i * 180) / colors.length;
    t.reset();
    t.setColor(...color);
    t.setPos(i, 0, 0);
    t.up(4);

    for (let _ = 0; _ < 360; _++) {
      t.forward(3);
      t.left(6);
    }
  }

  await buildBox.sendData();
  console.log('send data done')
})().catch(error => {
  console.error(error);
});
