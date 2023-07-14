import BuildBox from './buildBox.mjs'

(async () => {
  const rotations = [
    [0, 0, 0],
    [30, 0, 0],
    [0, 30, 0],
    [0, 0, 30],
  ]

  const roomName = '1000';
  const build_box = new BuildBox(roomName);

  build_box.setBoxSize(0.5);
  build_box.setBuildInterval(0.01);

  for (let i = 0; i < 10; i++) {
    build_box.createBox(-1, i, 0, 0, 1, 1);
    build_box.createBox(0, i, 0, 1, 0, 0);
    build_box.createBox(1, i, 0, 1, 1, 0);
    build_box.createBox(2, i, 0, 0, 1, 1);
  }

  for (let i = 0; i < 5; i++) {
    build_box.removeBox(0, i * 2, 0);
    build_box.removeBox(1, i * 2 + 1, 0);
  }

  for (let i = 0; i < rotations.length; i++) {
    const rotation = rotations[i]
    const pitch = rotation[0]
    const yaw = rotation[1]
    const roll = rotation[2]

    build_box.set_node(0, 0, 0, pitch, yaw, roll)
    await build_box.sendData()
    await build_box.sleepSecond(1)
    console.log('send data done')
  }
})().catch(error => {
  console.error(error);
});
