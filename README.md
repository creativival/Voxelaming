# ボクセラミング - ARKitを使ったプログラミング学習アプリ

<p align="center"><img src="https://creativival.github.io/voxelamming/image/voxelamming_ladder.png" alt="VoxelLadder" width="100%"/></p>

[//]: # (<p align="center"><video width="1280" height="720" controls>)

[//]: # (    <source src="video/voxelamming_top_video.mp4" type="video/mp4">)

[//]: # (</video></p>)

*Read this in other languages: [English](README.en.md), [日本語](README.md)*

## ボクセラミングとは

ボクセラミング = ボクセル + プログラミング

ボクセラミングは、ARKitを使ったプログラミング学習アプリです。ARKitに対応したiPhone、iPad（iOS13以上）で無料で使用できます。パソコンでプログラムしたボクセル（ピクセルと同様に3D空間における最小単位の立方体）を仮想空間上に配置して遊ぶことができます。

## 使い方

### パソコンの準備

パソコンは、Windows、Macの両対応です。お使いのパソコンに、プログラミング言語（Python、Node.js、Ruby、Swift）がインストールされていないときは、使いたい言語をインストールしてください。パソコンとデバイス（iPhone、iPad）のデータ通信はインターネット回線を使います（同じ回線に繋がなくてもよい）。以上で、パソコンの準備ができました。

### 平面アンカーの設置

ボクセラミングアプリを起動します。初回の起動時のみ、カメラの使用許可を求められるので「はい」で許可してください。ガメラが起動すると、ARKitが自動で現実世界の平面を探します。平面検知の印（赤緑青の座標軸）が出たら、画面をタップして平面アンカーを設置します。平面アンカーは白と黒のタイルで構成されています。以上でボクセルを設置する準備が整いました。

### ボクセルの設計（プログラミング）

パソコン（Windows、Mac）でボクセルを設置するための「ボクセルデータ」をプログラミングします。ボクセルデータには、「位置、色、サイズ、設置する間隔など」の情報が含まれます。対応の言語は、Scratch3 MOD、Python、JavaScript (Node.js)、Ruby、Swiftです。

スクリプトを作成しましょう。初めに、WebSocketサーバーのルームに接続するためにルームネームを設定します。ルームネームは、デバイス（iPhone、iPad）の画面中央に表示されている文字列です。変数room_name（roomName）にルームネームを代入します。

次に、各言語の繰り返し文や条件式などを使って、ボクセルデータを作成します。ボクセルの位置は、平面アンカーを基準にして、x軸、y軸、z軸の値を指定します。x軸は左右、y軸は上下、z軸は奥行き（手前がプラス）を表します（単位はセンチメートル）。ボクセルの大きさは、1.0cmを基準にして小数で指定します。色はRGB値で0から1までの小数で指定します。そして、ボクセルを設置する間隔を秒で指定します。ボクセルを設置する間隔を指定することで、ボクセルが一気に設置されるのではなく、時間をかけて設置されるようになります。

### ARボクセルの配置

スクリプトを実行すると、WebSocket通信でボクセルデータがデバイス（iPhone、iPad）に送信されます。データが受信できたら、デバイス画面の平面アンカーを基準にして、ARボクセルが設置されます。

＊ WebSocketサーバーが休止しているとき、データ送信が失敗する場合があります。そのときは、しばらく待ってから再度実行してください。

## メソッドの説明

スクリプトで使用するメソッドを説明します。各言語のメソッド名は、以下の通りです。

* set_box_size(size)：ボクセルの大きさを設定します。単位はセンチメートルです。デフォルトは1.0です。
* set_build_interval(interval)：ボクセルを設置する間隔（インターバル）を設定します。単位は秒です。デフォルトは0.01です。
* create_box(x, y, z, r, g, b)：ボクセルを設置します。x軸、y軸、z軸の位置と、色を指定します。色はRGB値で0から1までの小数で指定します。
* remove_box(x, y, z)：ボクセルを削除します。x軸、y軸、z軸の位置を指定します。（指定位置にボクセルがないときは、何もしません）
* write_sentence(sentence, x, y, z, r, g, b)：1行の文sentenceをボクセルで描きます。x軸、y軸、z軸の位置と、色をRGB値で指定します。
* send_data()：ボクセルデータをデバイス（iPhone、iPad）に送信します。
* clear_data()：ボクセルデータを初期化します。サイズ、インターバルも初期化します（送信後、ボクセルデータを初期化したいときに実行してください。）。
* set_node(x, y, z, pitch, yaw, roll):ボクセルをまとめるノードの位置（x, y, z）と角度（pitch, yaw, roll）を指定します。
* animate_node(x, y, z, pitch, yaw, roll, scale, interval):ノードのアニメーション。移動（x, y, z）、回転（pitch, yaw, roll）、拡大（scale）、設置する間隔（interval）を指定します。
`
＊ スネークケースとキャメルケースは読み替えてください。（set_box_size -> setBoxSize）

## サンプルスクリプト

[sampleフォルダー](https://github.com/creativival/voxelamming/tree/main/sample)に、サンプルスクリプトを用意しました。以下のスクリプトを実行すると、トップ画像のようなボクセルが設置されます。

### Scratch3 MOD

ボクセラミング拡張機能を読み込んで、スクリプトを作成してください。

[Xcratchで、サンプルプロジェクトを再生する](https://xcratch.github.io/editor/#https://creativival.github.io/voxelamming-extension/projects/example.sb3)

<p align="center"><img src="https://creativival.github.io/voxelamming/image/voxelamming_scratch3.png" alt="voxelamming_scratch3" width="100%"/></p>

### Python (3.6以上)

#### スクリプト

```python
# Python
from build_box import BuildBox

room_name = "1000"
build_box = BuildBox(room_name)

build_box.set_box_size(0.5)
build_box.set_build_interval(0.01)
build_box.set_node(0, 0, 0, pitch=0, yaw=0, roll=0)
build_box.animation_node(0, 0, 10, pitch=0, yaw=30, roll=0, scale=2, interval= 10)

for i in range(100):
  build_box.create_box(-1, i, 0, r=0, g=1, b=1)
  build_box.create_box(0, i, 0, r=1, g=0, b=0)
  build_box.create_box(1, i, 0, r=1, g=1, b=0)
  build_box.create_box(2, i, 0, r=0, g=1, b=1)

for i in range(50):
  build_box.remove_box(0, i * 2 + 1, 0)
  build_box.remove_box(1, i * 2, 0)

build_box.send_data()
```

#### 実行方法

```bash
$ python main.py

or  

$ python3 main.py
```

### JavaScript (Node.js)

#### スクリプト

```javascript
// JavaScript (Node.js)
import BuildBox from './buildBox.mjs';

const roomName = '1000';
const buildBox = new BuildBox(roomName);

buildBox.setBoxSize(0.5);
buildBox.setBuildInterval(0.01);

for (let i = 0; i < 100; i++) {
  buildBox.createBox(-1, i, 0, 0, 1, 1);
  buildBox.createBox(0, i, 0, 1, 0, 0);
  buildBox.createBox(1, i, 0, 1, 1, 0);
  buildBox.createBox(2, i, 0, 0, 1, 1);
}

for (let i = 0; i < 50; i++) {
  buildBox.removeBox(0, i * 2, 0);
  buildBox.removeBox(1, i * 2 + 1, 0);
}

buildBox.sendData();
```

#### 実行方法

```bash
$ node main.mjs
```

### Ruby

#### スクリプト

```ruby
# Ruby
require_relative 'build_box'

room_name = '1000'
build_box = BuildBox.new(room_name)

build_box.set_box_size(0.5)
build_box.set_build_interval(0.01)

for i in 0...100
  build_box.create_box(-1, i, 0, 0, 1, 1)
  build_box.create_box(0, i, 0, 1, 0, 0)
  build_box.create_box(1, i, 0, 1, 1, 0)
  build_box.create_box(2, i, 0, 0, 1, 1)
end

for i in 0...50
  build_box.remove_box(0, i * 2, 0)
  build_box.remove_box(1, i * 2 + 1, 0)
end

build_box.send_data
```

#### 実行方法

```bash
$ ruby main.rb
```

### Swift

#### スクリプト

```swift
// Swift
import Foundation

let roomName = "1000"

if #available(iOS 15.0, macOS 12.0, *) {
    let buildBox = BuildBox(roomName)

    buildBox.setBoxSize(0.5)
    buildBox.setBuildInterval(0.01)

    for i in 0..<100 {
        buildBox.createBox(-1, Double(i), 0, r: 0, g: 1, b: 1)
        buildBox.createBox(0, Double(i), 0, r: 1, g: 0, b: 0)
        buildBox.createBox(1, Double(i), 0, r: 1, g: 1, b: 0)
        buildBox.createBox(2, Double(i), 0, r: 0, g: 1, b: 1)
    }

    for i in 0..<50 {
        buildBox.removeBox(0, Double(i * 2), 0)
        buildBox.removeBox(1, Double(i * 2 + 1), 0)
    }

    buildBox.sendData()

    RunLoop.main.run(until: Date(timeIntervalSinceNow: 10)) // Or longer depending on your needs
} else {
    fatalError("This script requires iOS 15.0 / macOS 12.0 or later.")
}
```

#### 実行方法

```bash
$ cd swift/Sources
$ swift run
```
## ショーケース

Pythonのみ例示します。他の言語は変換してください。

### 球体

<p align="center"><img src="https://creativival.github.io/voxelamming/image/square_sample.png" alt="square" width="50%"/></p>

```python
from build_box import BuildBox

room_name = "1000"
build_box = BuildBox(room_name)

radius = 11

build_box.set_box_size(0.5)
build_box.set_build_interval(0.01)
build_box.set_node(0, radius, 0, pitch=0, yaw=0, roll=0)

for i in range(-radius, radius + 1):
  for j in range(-radius, radius + 1):
    for k in range(-radius, radius + 1):
      if (radius -1 ) ** 2 <= i ** 2 + j ** 2 + k ** 2 < radius ** 2:
        print(i, j, k)
        build_box.create_box(i, j, k, 0, 1, 1)

build_box.send_data()
```

### ノードの移動

<p align="center"><img src="https://creativival.github.io/voxelamming/image/move_sample.png" alt="node_move" width="50%"/></p>

```python
import time
from build_box import BuildBox

room_name = "1000"
build_box = BuildBox(room_name)

build_box.set_box_size(0.5)
build_box.set_build_interval(0.01)

for i in range(10):
  build_box.create_box(-1, i, 0, r=0, g=1, b=1)
  build_box.create_box(0, i, 0, r=1, g=0, b=0)
  build_box.create_box(1, i, 0, r=1, g=1, b=0)
  build_box.create_box(2, i, 0, r=0, g=1, b=1)

for i in range(5):
  build_box.remove_box(0, i * 2 + 1, 0)
  build_box.remove_box(1, i * 2, 0)

for i in range(5):
  build_box.set_node(-25 + i * 10, 0, 0, pitch=0, yaw=0, roll=0)
  build_box.send_data()
  time.sleep(1)
```

### ノードの回転

<p align="center"><img src="https://creativival.github.io/voxelamming/image/rotation_sample.png" alt="node_rotation" width="50%"/></p>

```python
import time
from build_box import BuildBox

room_name = "1000"
build_box = BuildBox(room_name)

rotations = [
  [0, 0, 0],
  [30, 0, 0],
  [0, 30, 0],
  [0, 0, 30],
]

build_box.set_box_size(0.5)
build_box.set_build_interval(0.01)

for i in range(10):
  build_box.create_box(-1, i, 0, r=0, g=1, b=1)
  build_box.create_box(0, i, 0, r=1, g=0, b=0)
  build_box.create_box(1, i, 0, r=1, g=1, b=0)
  build_box.create_box(2, i, 0, r=0, g=1, b=1)

for i in range(5):
  build_box.remove_box(0, i * 2 + 1, 0)
  build_box.remove_box(1, i * 2, 0)

for rotation in rotations:
  pitch, yaw, roll = rotation

  build_box.set_node(0, 0, 0, pitch=pitch, yaw=yaw, roll=roll)
  build_box.send_data()
  time.sleep(1)
```


### ノードのアニメーション

<p align="center"><img src="https://creativival.github.io/voxelamming/image/animation_sample.png" alt="node_animation" width="50%"/></p>

```python
import time
from build_box import BuildBox

room_name = "1000"
build_box = BuildBox(room_name)

build_box.set_box_size(0.5)
build_box.set_build_interval(0.01)

for i in range(10):
  build_box.create_box(-1, i, 0, r=0, g=1, b=1)
  build_box.create_box(0, i, 0, r=1, g=0, b=0)
  build_box.create_box(1, i, 0, r=1, g=1, b=0)
  build_box.create_box(2, i, 0, r=0, g=1, b=1)

for i in range(5):
  build_box.remove_box(0, i * 2 + 1, 0)
  build_box.remove_box(1, i * 2, 0)

build_box.send_data()

time.sleep(1)

build_box.animation_node(10, 0, 0, pitch=0, yaw=30, roll=0, scale=2, interval= 10)
build_box.send_data()
```

### 文字表示

<p align="center"><img src="https://creativival.github.io/voxelamming/image/sentence_sample.png" alt="sentence" width="50%"/></p>

```python
import time
from build_box import BuildBox

room_name = "1000"
build_box = BuildBox(room_name)

build_box.set_box_size(0.5)
build_box.set_build_interval(0.01)

build_box.set_node(0, 16, 0, pitch=0, yaw=0, roll=0)
build_box.write_sentence("Hello World", 0, 0, 0, r=1, g=0, b=0, alpha=1)
build_box.send_data()

time.sleep(1)

build_box.set_node(0, 0, 0, pitch=0, yaw=0, roll=0)
build_box.write_sentence("こんにちは", 0, 0, 0, r=0, g=1, b=0, alpha=1)
build_box.send_data()
```

### 透明ボクセル

<p align="center"><img src="https://creativival.github.io/voxelamming/image/set_alpha_sample.png" alt="sentence" width="50%"/></p>

```python
from build_box import BuildBox

room_name = "1000"
build_box = BuildBox(room_name)

build_box.set_box_size(0.3)
build_box.set_build_interval(0.01)
build_box.set_node(0, 0, 0, pitch=0, yaw=0, roll=0)
build_box.animation_node(0, 0, 10, pitch=0, yaw=30, roll=0, scale=2, interval= 0)

for i in range(100):
  alpha = (100 - i) / 100
  build_box.create_box(-1, i, 0, r=0, g=1, b=1, alpha=alpha)
  build_box.create_box(0, i, 0, r=1, g=0, b=0, alpha=alpha)
  build_box.create_box(1, i, 0, r=1, g=1, b=0, alpha=alpha)
  build_box.create_box(2, i, 0, r=0, g=1, b=1, alpha=alpha)

for i in range(50):
  build_box.remove_box(0, i * 2 + 1, 0)
  build_box.remove_box(1, i * 2, 0)

build_box.send_data()
```

### ユーザー共有

準備中

## 設定

画面右上の「Settings」ボタンから設定画面に移動できます。デバッグモードをオフにすると、画面の情報表示が無効になります。

## ARワールドのリセット

画面右下の「リセット」ボタンからARワールドをリセットできます。リセットすると、ユーザーが作成したボクセルは全て削除されます。

## ライセンス

[MIT License](https://github.com/creativival/voxelamming/blob/master/LICENSE)

## 作者

creativival


