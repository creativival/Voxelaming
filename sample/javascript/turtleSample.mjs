import BuildBox from './buildBox.mjs';
import Turtle from './turtle.mjs';

(async () => {
  const roomName = "1000";
  const buildBox = new BuildBox(roomName);

  buildBox.setBoxSize(0.3);
  buildBox.setBuildInterval(0.01);
  const t = new Turtle(buildBox);

  t.setColor(1, 0, 0, 1);

  t.forward(10);
  t.left(90);
  t.forward(10);
  t.left(90);
  t.forward(10);
  t.left(90);
  t.forward(10);
  t.left(90);

  t.up(90);
  t.forward(10);
  t.down(90);
  t.forward(10);
  t.left(90);
  t.forward(10);
  t.left(90);
  t.forward(10);
  t.left(90);
  t.forward(10);

  buildBox.sendData();
  console.log('send data done')
})().catch(error => {
  console.error(error);
});
