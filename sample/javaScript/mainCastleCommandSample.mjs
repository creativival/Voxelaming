import BuildBox from './buildBox.mjs';

(async () => {
  const roomName = '1000';
  const buildBox = new BuildBox(roomName);

  buildBox.setCommand('japaneseCastle')

  await buildBox.sendData();
  console.log('send data done')
})().catch(error => {
  console.error(error);
});
