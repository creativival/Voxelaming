// import { BuildBox } from 'voxelamming';
import BuildBox from './buildBox.js';  // test

// Voxelammingアプリに表示されている部屋名を指定します
const roomName = "1000";

// BuildBoxクラスのインスタンスを生成します
const buildBox = new BuildBox(roomName);

// ボクセルのサイズを設定します
buildBox.setBoxSize(1);
// ボクセルの配置間隔を設定します
buildBox.setBuildInterval(0.01);
// 座標軸を表示します
buildBox.setCommand('axis');

// ボクセルを配置するため、位置と色を設定します
buildBox.changeShape('sphere');
buildBox.createBox(0, 0, 0, 1, 0, 0, 1);
buildBox.createModel('Skull', -2, 0, 0, 0, 0, 0, 1, 'skull_model_1');
buildBox.createModel('Skull', 2, 0, 0, 0, 0, 0, 1, 'skull_model_2');
buildBox.createModel('Skull', 0, 2, 0, 0, 0, 0, 1, 'skull_model_3');

// ボクセルデータをアプリに送信します
await buildBox.sendData("skulls");
buildBox.clearData()
console.log('send data done')

// モデルを移動します
for (let i = 0; i < 20; i++) {
  buildBox.setBoxSize(1);
  await buildBox.sleepSecond(1)
  buildBox.moveModel('skull_model_1', -2, i * 0.2, 0, 0, 0, 0, 1);
  buildBox.moveModel('skull_model_2', 2, 0, 0, 0, i * 10, 0, 1);
  buildBox.moveModel('skull_model_3', 0, 2, 0,  0, 0, 0, i * 0.1 + 1);
  await buildBox.sendData();
}
