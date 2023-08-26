import BuildBox from './buildBox.mjs';

(async () => {
  const roomName = "1000";
  const size = 1.0;
  const radius = 1.5;
  const repeatCount = 100;

  const buildBox = new BuildBox(roomName);
  buildBox.setBuildInterval(0.01);
  buildBox.setBoxSize(size);
  buildBox.changeShape("sphere");
  buildBox.setCommand('float');

  for (let i = 0; i < repeatCount; i++) {
    const angle = (i * 720 / repeatCount) * (Math.PI / 180);
    const x = radius * Math.cos(angle);
    const y = i;
    const z = radius * Math.sin(angle);

    buildBox.createBox(x, y, z, 0, 1, 1, 1);
    buildBox.createBox(-x, y, -z, 0, 1, 1, 1);
    if (i % 2 === 0) {
      buildBox.createBox(x / 3, y, z / 3, 1, 0, 0, 1);
    } else {
      buildBox.createBox(-x / 3, y, -z / 3, 1, 1, 0, 1);
    }
  }

  await buildBox.sendData();
  console.log('send data done')
})().catch(error => {
  console.error(error);
});
