import { BuildBox } from 'voxelamming';
// import BuildBox from './buildBox.js';  // test

// Voxelammingアプリに表示されている部屋名を指定します
const roomName = "1000";

// BuildBoxクラスのインスタンスを生成します
const buildBox = new BuildBox(roomName);

// ボクセルのサイズを設定します
const boxSize = 10;
buildBox.setBoxSize(boxSize);
// ボクセルの配置間隔を設定します
buildBox.setBuildInterval(0.01);
// 座標軸を表示します
buildBox.setCommand('axis');

// ボクセルを配置するため、位置と色を設定します
buildBox.changeShape('sphere');
buildBox.createBox(0, 0, 0, 1, 0, 0, 1);
buildBox.createModel('Earth', 0, 2, 0, 1);
buildBox.createModel('ToyCar', 0, 4, 0, 90, 0, 0, 1);
buildBox.createModel('ToyBiplane', 0, 6, 0, 0, 90, 0, 1);
buildBox.createModel('Robot', 0, 8, 0, 0, 0, 90, 1);
buildBox.createModel('Skull', 0, 10, 0, 0, 0, 90, 1);
buildBox.createModel('Skull', 0, 12, 0, 90, 0, 0, 1);
buildBox.createModel('Skull', 0, 14, 0, 90, 0, 90, 1);

// ボクセルデータをアプリに送信します
await buildBox.sendData("createModel");
console.log('send data done')

