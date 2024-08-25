// import { Voxelamming, Turtle } from 'voxelamming';
import { Turtle } from 'voxelamming'; // test
import Voxelamming from './voxelamming.js';  // test

const roomName = "1000";
const vox = new Voxelamming(roomName);

vox.setBoxSize(0.3);
vox.setBuildInterval(0.01);
const t = new Turtle(vox);

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

await vox.sendData();
console.log('send data done');
