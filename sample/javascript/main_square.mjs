import BuildBox from './buildBox.mjs';

(async () => {
  const roomName = '1000';
  const buildBox = new BuildBox(roomName);

  const radius = 11;

  buildBox.setBoxSize(0.5);
  buildBox.setBuildInterval(0.01);
  buildBox.setNode(0, radius, 0, 0, 0, 0)
  
  for (let i = -radius; i <= radius; i++) {
    for (let j = -radius; j <= radius; j++) {
      for (let k = -radius; k <= radius; k++) {
        if ((i ** 2 + j ** 2 + k ** 2 < radius ** 2) && (i ** 2 + j ** 2 + k ** 2 >= (radius - 2) ** 2)) {
          console.log(i, j, k)
          buildBox.createBox(i, j, k, 0, 1, 1)
        }
      }
    }
  }

  await buildBox.sendData();
  console.log('send data done')
})().catch(error => {
  console.error(error);
});
