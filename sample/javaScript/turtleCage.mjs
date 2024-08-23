// import { Voxelamming, Turtle } from 'voxelamming';
import { Turtle } from 'voxelamming'; // test
import Voxelamming from './voxelamming.js';  // test

const roomName = "1000";
const voxelamming = new Voxelamming(roomName);

voxelamming.setBoxSize(0.3);
voxelamming.setBuildInterval(0.01);
voxelamming.setCommand('liteRender')
const t = new Turtle(voxelamming);

const colors = [
[0, 0, 0, 1],
[1, 0, 0, 1],
[0, 1, 0, 1],
[0, 0, 1, 1],
[1, 1, 0, 1],
[0, 1, 1, 1],
[1, 0, 1, 1],
[1, 1, 1, 1],
[0.5, 0, 0, 1],
[0, 0.5, 0, 1],
[0, 0, 0.5, 1],
[0.5, 0.5, 0, 1],
[0, 0.5, 0.5, 1],
[0.5, 0, 0.5, 1],
[0.5, 0.5, 0.5, 1],
];

for (let j = 0; j < colors.length; j++) {
const color = colors[j];
const polarPhi = (j * 180) / colors.length;
t.reset();
t.setColor(...color);
t.left(polarPhi);

for (let i = 0; i < 60; i++) {
t.forward(4);
t.up(6);
}
}

await voxelamming.sendData();
console.log('send data done');
