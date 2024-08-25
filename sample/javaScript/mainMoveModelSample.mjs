// import { Voxelamming } from 'voxelamming';
import Voxelamming from './voxelamming.js';  // test

// Voxelammingアプリに表示されている部屋名を指定します
const roomName = "1000";

// Voxelammingクラスのインスタンスを生成します
const vox = new Voxelamming(roomName);

// ボクセルのサイズを設定します
vox.setBoxSize(1);
// ボクセルの配置間隔を設定します
vox.setBuildInterval(0.01);
// 座標軸を表示します
vox.setCommand('axis');

// ボクセルを配置するため、位置と色を設定します
vox.changeShape('sphere');
vox.createBox(0, 0, 0, 1, 0, 0, 1);
vox.createModel('Skull', -2, 0, 0, 0, 0, 0, 1, 'skull_model_1');
vox.createModel('Skull', 2, 0, 0, 0, 0, 0, 1, 'skull_model_2');
vox.createModel('Skull', 0, 2, 0, 0, 0, 0, 1, 'skull_model_3');

// ボクセルデータをアプリに送信します
await vox.sendData("skulls");
await vox.clearData()
console.log('send data done')

// モデルを移動します
for (let i = 0; i < 20; i++) {
  vox.setBoxSize(1);
  await vox.sleepSecond(0.1)
  vox.moveModel('skull_model_1', -2, i * 0.2, 0, 0, 0, 0, 1);
  vox.moveModel('skull_model_2', 2, 0, 0, 0, i * 10, 0, 1);
  vox.moveModel('skull_model_3', 0, 2, 0,  0, 0, 0, i * 0.1 + 1);
  await vox.sendData();
}
