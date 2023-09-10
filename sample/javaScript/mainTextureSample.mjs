import BuildBox from './buildBox.mjs';

(async () => {
  const textureNames = ["grass", "stone", "dirt", "planks", "bricks"];
  const roomName = "1000";
  const buildBox = new BuildBox(roomName);

  buildBox.setBoxSize(1);
  buildBox.setBuildInterval(0.01);

  textureNames.forEach((texture, i) => {
    buildBox.createBox(0, textureNames.length - i - 1, 0, 0, 0, 0, 1, texture);
  });

  await buildBox.sendData();
  buildBox.clearData();
  await buildBox.sleepSecond(1)

  buildBox.setBoxSize(1);
  buildBox.setBuildInterval(0.01);
  buildBox.changeShape('sphere');
  textureNames.forEach((texture, i) => {
    buildBox.createBox(1, textureNames.length - i - 1, 0, 0, 0, 0, 1, texture);
  });

  await buildBox.sendData();
  buildBox.clearData();
  await buildBox.sleepSecond(1)

  buildBox.setBoxSize(1);
  buildBox.setBuildInterval(0.01);
  buildBox.changeShape('plane');
  textureNames.forEach((texture, i) => {
    buildBox.createBox(2, textureNames.length - i - 1, 0, 0, 0, 0, 1, texture);
  });

  await buildBox.sendData();
  buildBox.clearData();
  console.log('send data done')
})().catch(error => {
  console.error(error);
});
