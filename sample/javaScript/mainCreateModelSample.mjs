// import { Voxelamming } from 'voxelamming';
import Voxelamming from './voxelamming.js';  // test

// Voxelammingアプリに表示されている部屋名を指定します
const roomName = "1000";

// Voxelammingクラスのインスタンスを生成します
const voxelamming = new Voxelamming(roomName);

// ボクセルのサイズを設定します
const boxSize = 1;
voxelamming.setBoxSize(boxSize);
// ボクセルの配置間隔を設定します
voxelamming.setBuildInterval(0.01);
// 座標軸を表示します
voxelamming.setCommand('axis');

// ボクセルを配置するため、位置と色を設定します
voxelamming.changeShape('sphere');
voxelamming.createBox(0, 0, 0, 1, 0, 0, 1);
voxelamming.createModel('Earth', 0, 2, 0, 1);
voxelamming.createModel('ToyCar', 0, 4, 0, 90, 0, 0, 1);
voxelamming.createModel('ToyBiplane', 0, 6, 0, 0, 90, 0, 1);
voxelamming.createModel('Robot', 0, 8, 0, 0, 0, 90, 1);
voxelamming.createModel('Skull', 0, 10, 0, 0, 0, 90, 1);
voxelamming.createModel('Skull', 0, 12, 0, 90, 0, 0, 1);
voxelamming.createModel('Skull', 0, 14, 0, 90, 0, 90, 1);

// ボクセルデータをアプリに送信します
await voxelamming.sendData("createModel");
console.log('send data done')

