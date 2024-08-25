// import { Voxelamming } from 'voxelamming';
import Voxelamming from './voxelamming.js';  // test

// Voxelammingアプリに表示されている部屋名を指定します
const roomName = "1000";

// Voxelammingクラスのインスタンスを生成します
const vox = new Voxelamming(roomName);

// ボクセルのサイズを設定します
const boxSize = 1;
vox.setBoxSize(boxSize);
// ボクセルの配置間隔を設定します
vox.setBuildInterval(0.01);
// 座標軸を表示します
vox.setCommand('axis');

// ボクセルを配置するため、位置と色を設定します
vox.changeShape('sphere');
vox.createBox(0, 0, 0, 1, 0, 0, 1);
vox.createModel('Earth', 0, 2, 0, 1);
vox.createModel('ToyCar', 0, 4, 0, 90, 0, 0, 1);
vox.createModel('ToyBiplane', 0, 6, 0, 0, 90, 0, 1);
vox.createModel('Robot', 0, 8, 0, 0, 0, 90, 1);
vox.createModel('Skull', 0, 10, 0, 0, 0, 90, 1);
vox.createModel('Skull', 0, 12, 0, 90, 0, 0, 1);
vox.createModel('Skull', 0, 14, 0, 90, 0, 90, 1);

// ボクセルデータをアプリに送信します
await vox.sendData("createModel");
console.log('send data done')

