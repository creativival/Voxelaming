// import { Voxelamming } from 'voxelamming';
import Voxelamming from './voxelamming.js';  // test

// Voxelammingアプリに表示されている部屋名を指定します
const roomName = "1000";

// Voxelammingクラスのインスタンスを生成します
const voxelamming = new Voxelamming(roomName);

// ボクセルのサイズを設定します
voxelamming.setBoxSize(1);
// ボクセルの配置間隔を設定します
voxelamming.setBuildInterval(0.01);
// 座標軸を表示します
voxelamming.setCommand('axis');

// ボクセルを配置するため、位置と色を設定します
voxelamming.changeShape('sphere');
voxelamming.createBox(0, 0, 0, 1, 0, 0, 1);
voxelamming.createModel('Skull', -2, 0, 0, 0, 0, 0, 1, 'skull_model_1');
voxelamming.createModel('Skull', 2, 0, 0, 0, 0, 0, 1, 'skull_model_2');
voxelamming.createModel('Skull', 0, 2, 0, 0, 0, 0, 1, 'skull_model_3');

// ボクセルデータをアプリに送信します
await voxelamming.sendData("skulls");
await voxelamming.clearData()
console.log('send data done')

// モデルを移動します
for (let i = 0; i < 20; i++) {
  voxelamming.setBoxSize(1);
  await voxelamming.sleepSecond(0.1)
  voxelamming.moveModel('skull_model_1', -2, i * 0.2, 0, 0, 0, 0, 1);
  voxelamming.moveModel('skull_model_2', 2, 0, 0, 0, i * 10, 0, 1);
  voxelamming.moveModel('skull_model_3', 0, 2, 0,  0, 0, 0, i * 0.1 + 1);
  await voxelamming.sendData();
}
