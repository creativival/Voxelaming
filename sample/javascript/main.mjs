import BuildBox from './buildBox.mjs';

(async () => {
  const roomName = '1000';
  const build_box = new BuildBox(roomName);

  build_box.setBoxSize(0.5);
  build_box.setBuildInterval(0.01);

  for (let i = 0; i < 100; i++) {
    build_box.createBox(-1, i, 0, 0, 1, 1);
    build_box.createBox(0, i, 0, 1, 0, 0);
    build_box.createBox(1, i, 0, 1, 1, 0);
    build_box.createBox(2, i, 0, 0, 1, 1);
  }

  for (let i = 0; i < 50; i++) {
    build_box.removeBox(0, i * 2, 0);
    build_box.removeBox(1, i * 2 + 1, 0);
  }

  await build_box.sendData();
  console.log('send data done')
})().catch(error => {
  console.error(error);
});
