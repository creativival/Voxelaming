const { BuildBox } = require('voxelamming-node');

(async () => {
  const roomName = '1000';
  const buildBox = new BuildBox(roomName);

  buildBox.setBoxSize(0.5);
  buildBox.setBuildInterval(0.01);

  buildBox.translate(0, 16, 0, 0, 0, 0)
  buildBox.writeSentence('Hello, world', 0, 0, 0, 1, 0, 0, 1)
  await buildBox.sendData()

  await buildBox.sleepSecond(1)

  buildBox.translate(0, 0, 0, 0, 0, 0)
  buildBox.writeSentence('こんにちは', 0, 0, 0, 0, 1, 0, 1)
  await buildBox.sendData();
  console.log('send data done')
})().catch(error => {
  console.error(error);
});
