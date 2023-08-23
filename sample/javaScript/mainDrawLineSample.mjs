import BuildBox from './buildBox.mjs';

(async () => {
  const roomName = '1000';
  const buildBox = new BuildBox(roomName);

  buildBox.setBoxSize(0.5);
  buildBox.setBuildInterval(0.01);

  buildBox.drawLine(0, 0, 0, 5, 10, 20, 1, 0, 0, 1)

  await buildBox.sendData();
  console.log('send data done')
})().catch(error => {
  console.error(error);
});
