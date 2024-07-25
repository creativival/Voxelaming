# **ボクセラミング - ARプログラミング学習アプリ**

<p align="center"><img src="https://creativival.github.io/voxelamming/image/voxelamming_icon.png" alt="Voxelamming Logo" width="200"/></p>

ボクセラミングは、ARを用いたプログラミング学習アプリです。プログラミング初心者でも、視覚的に楽しくプログラミングを学ぶことができます。ボクセラミングは、iOS 16以上のiPhoneとiPad、そしてApple Vision Proに対応しています。

<a href="https://apps.apple.com/jp/app/%E3%83%9C%E3%82%AF%E3%82%BB%E3%83%A9%E3%83%9F%E3%83%B3%E3%82%B0/id6451427658?itsct=apps_box_badge&amp;itscg=30200" style="display: inline-block; overflow: hidden; border-radius: 13px; width: 250px; height: 83px;"><img src="https://tools.applemediaservices.com/api/badges/download-on-the-app-store/black/ja-jp?size=250x83&amp;releaseDate=1690502400" alt="Download on the App Store" style="border-radius: 13px; width: 250px; height: 83px;"></a>

<p align="center"><img src="https://creativival.github.io/voxelamming/image/voxelamming_ladder.png" alt="VoxelLadder" width="50%"/></p>

* 別の言語で読む: [English](README.en.md), [日本語](README.md)*

## ボクセラミングとは

Voxelamming = ボクセル + プログラミング

ボクセラミングは、AR技術を使ってプログラミングを学べるアプリです。ボクセル (3D空間における最小単位の立方体) をコードで配置し、インタラクティブな3D作品を作ることができます。

**対象ユーザー:**

* プログラミング初心者：視覚的なフィードバックを得ながら、プログラミングの基礎を学ぶことができます。
* ジェネラティブアーティスト：コードを使って、創造性豊かな3Dアート作品を生み出すことができます。

## 特徴

* **ARによる直感的な操作:** 現実世界にボクセルを配置することで、空間認識能力を高めながらプログラミングを学べます。
* **多彩なプログラミング言語:** Scratch3 MOD、Python、JavaScript (Node.js)、Ruby、Swiftに対応しています。
* **クロスプラットフォーム:**  Windows、Mac、iOS (iPhone, iPad, Apple Vision Pro) で動作します。
* **無料:**  無料でダウンロードして利用できます。

## 使い方

ボクセラミングを使うには、以下の3つのステップが必要です。

1. **デバイスの準備:** iOS 16以上のiPhoneまたはiPad、あるいはApple Vision Proが必要です。
2. **平面アンカーの設置:** アプリを起動し、画面の指示に従って現実世界の平面にアンカーを設置します。
3. **ボクセルのモデリング:** パソコンを使って、ボクセルの位置、色、サイズなどを指定するコードを作成し、アプリに送信します。

### 1. デバイスの準備

App Storeからボクセラミングアプリをダウンロードし、インストールしてください。

* iPhone/iPad版: [App Store](https://apps.apple.com/jp/app/%E3%83%9C%E3%82%AF%E3%82%BB%E3%83%A9%E3%83%9F%E3%83%B3%E3%82%B0/id6451427658?itsct=apps_box_link&itscg=30200)
* Apple Vision Pro版: [App Store](https://apps.apple.com/jp/app/%E3%83%9C%E3%82%AF%E3%82%BB%E3%83%A9%E3%83%9F%E3%83%B3%E3%82%B0-%E3%82%B9%E3%82%BF%E3%82%B8%E3%82%AA/id6475821648)

### 2. 平面アンカーの設置

#### iPhone/iPadの場合

1. ボクセラミングアプリを起動します。
2. 初回起動時は、カメラの使用許可を求められます。「はい」をタップして許可してください。
3. カメラが起動すると、ARが自動で現実世界の平面を探します。平面検知の印（赤緑青の座標軸）が出たら、画面をタップして平面アンカーを設置します。平面アンカーは白と黒のタイルで構成されています。

#### Apple Vision Proの場合

1. ボクセラミング Studioアプリを起動します。
2. 「Set Base Anchor」ボタンをタップして、ベースアンカーを設置します。ベースアンカーは白と黒のタイルで構成されています。
3. ベースアンカーは、ドラッグして移動することができます。

### 3. ボクセルのモデリング（プログラミング）

パソコン (Windows, Mac) を使って、ボクセルを配置するためのコードを作成します。

1. **プログラミング言語を選択:**  Scratch3 MOD、Python、JavaScript (Node.js)、Ruby、Swiftから選択できます。
2. **WebSocketサーバーのルーム名を確認:**  デバイスでボクセラミングアプリを起動し、画面中央に表示されているルーム名を確認します。
3. **サンプルコードを参考に:** [sampleフォルダー](https://github.com/creativival/voxelamming/tree/main/sample) のサンプルコードを参考に、独自のコードを作成します。

#### ボクセルデータ

ボクセルデータは、ボクセルの位置、色、サイズなどを指定するデータです。

* **位置:** 平面アンカーを基準としたx軸、y軸、z軸の値で指定します (単位はセンチメートル)。
    * x軸: 左右
    * y軸: 上下
    * z軸: 奥行き (手前がプラス)
* **サイズ:** 1.0cmを基準とした小数で指定します。
* **色:** RGB値で、0から1までの小数で指定します。
* **設置間隔:** ボクセルが設置される間隔を秒単位で指定します。デフォルトは0.01秒間隔でボクセルが設置されていきます。

**例：赤いボクセルを (x: 10, y: 5, z: -2) の位置に、サイズ2倍で設置する**

```python
# Python
build_box.set_box_size(2.0)  # サイズを2倍に設定
build_box.create_box(10, 5, -2, 1, 0, 0)  # 赤いボクセルを設置
build_box.send_data() # データ送信
```

#### メソッドの説明

| メソッド名 | 説明 | 引数 |
|---|---|---|
| `set_room_name(room_name)` | デバイスと通信するためのルーム名を設定します。 | `room_name`: ルーム名 (string) |
| `set_box_size(size)` | ボクセルのサイズを設定します (デフォルト: 1.0)。 | `size`: サイズ (float) |
| `set_build_interval(interval)` | ボクセルの設置間隔を設定します (デフォルト: 0.01秒)。 | `interval`: 間隔 (float) |
| `change_shape(shape)` | ボクセルの形状を変更します。 | `shape`: 形状 ("box", "square", "plane") |
| `change_material(is_metallic, roughness)` | ボクセルの材質を変更します。 | `is_metallic`: 金属にするかどうか (boolean), `roughness`: 粗さ (float) |
| `create_box(x, y, z, r, g, b, alpha)` | ボクセルを設置します。 | `x`, `y`, `z`: 位置 (float), `r`, `g`, `b`, `alpha`: 色 (float, 0-1) |
| `create_box(x, y, z, texture)` | テクスチャ付きのボクセルを設置します。 | `x`, `y`, `z`: 位置 (float), `texture`: テクスチャ名 (string) |
| `remove_box(x, y, z)` | ボクセルを削除します。 | `x`, `y`, `z`: 位置 (float) |
| `write_sentence(sentence, x, y, z, r, g, b, alpha)` | 文字列をボクセルで描画します。 | `sentence`: 文字列 (string), `x`, `y`, `z`: 位置 (float), `r`, `g`, `b`, `alpha`: 色 (float, 0-1) |
| `set_light(x, y, z, r, g, b, alpha, intensity, interval, light_type)` | ライトを設置します。 | `x`, `y`, `z`: 位置 (float), `r`, `g`, `b`, `alpha`: 色 (float, 0-1), `intensity`: 強さ (float), `interval`: 点滅間隔 (float), `light_type`: ライトの種類 ("point", "spot", "directional") |
| `set_command(command)` | コマンドを実行します。 | `command`: コマンド ("axis", "japaneseCastle", "float", "liteRender") |
| `draw_line(x1, y1, z1, x2, y2, z2, r, g, b, alpha)` | 2点間に線を描画します。 | `x1`, `y1`, `z1`: 始点 (float), `x2`, `y2`, `z2`: 終点 (float), `r`, `g`, `b`, `alpha`: 色 (float, 0-1) |
| `send_data(name)` | ボクセルデータをデバイスに送信します。name引数を設定すると、ボクセルデータを履歴として保存して、再現することができます。 | |
| `clear_data()` | ボクセルデータを初期化します。 | |
| `translate(x, y, z, pitch, yaw, roll)` | ボクセルの座標系を移動・回転します。 | `x`, `y`, `z`: 移動量 (float), `pitch`, `yaw`, `roll`: 回転量 (float) |
| `animate(x, y, z, pitch, yaw, roll, scale, interval)` | ボクセルをアニメーションさせます。 | `x`, `y`, `z`: 移動量 (float), `pitch`, `yaw`, `roll`: 回転量 (float), `scale`: スケール (float), `interval`: 間隔 (float) |
| `animate_global(x, y, z, pitch, yaw, roll, scale, interval)` | 全てのボクセルをアニメーションさせます。 | `x`, `y`, `z`: 移動量 (float), `pitch`, `yaw`, `roll`: 回転量 (float), `scale`: スケール (float), `interval`: 間隔 (float) |
| `push_matrix()` | 現在の座標系をスタックに保存します。 | |
| `pop_matrix()` | スタックから座標系を復元します。 | |
| `frame_in()` | フレームの記録を開始します。 | |
| `frame_out()` | フレームの記録を終了します。 | |
| `set_frame_fps(fps)` | フレームレートを設定します (デフォルト: 2)。 | `fps`: フレームレート (int) |
| `set_frame_repeats(repeats)` | フレームの再生回数を設定します (デフォルト: 10)。 | `repeats`: 再生回数 (int) |


**注記:**

* 上記のメソッド名はPythonの例です。他の言語では、メソッド名が異なる場合があります。
* 詳細は、各言語のサンプルコードを参照してください。

### 4. 実行と確認

作成したコードを実行すると、デバイスにボクセルデータが送信され、AR空間上にボクセルが構築されます。

## サンプルスクリプト

[sampleフォルダー](https://github.com/creativival/voxelamming/tree/main/sample)に、サンプルスクリプトを用意しました。以下のスクリプトを実行すると、トップ画像のようなボクセルが設置されます。

### Scratch3 MOD

ボクセラミング拡張機能を読み込んで、スクリプトを作成してください。

[Xcratchで、サンプルプロジェクトを再生する](https://xcratch.github.io/editor/#https://creativival.github.io/voxelamming-extension/projects/example.sb3)

<p align="center"><img src="https://creativival.github.io/voxelamming/image/voxelamming_scratch3.png" alt="voxelamming_scratch3" width="100%"/></p>

### Scratch3 MOD（タートルプログラミング）

Scratch3 MODのタートルプログラミングを使って、ボクセルを設置することができます。直感的にボクセルを設置できるので、プログラミング初心者、特に子どもにおすすめです。

[Xcratchで、サンプルプロジェクトを再生する](https://xcratch.github.io/editor/#https://creativival.github.io/voxelamming-turtle-extension/projects/example.sb3)

<p align="center"><img src="https://creativival.github.io/voxelamming/image/voxelamming_turtle_scratch3.png" alt="voxelamming_turtle_scratch3" width="100%"/></p>

### Python (3.6以上)

#### スクリプト

```python
# Python
from voxelamming import BuildBox

room_name = "1000"
build_box = BuildBox(room_name)

build_box.set_box_size(0.5)
build_box.set_build_interval(0.01)
build_box.translate(0, 0, 0, pitch=0, yaw=0, roll=0)
build_box.animate(0, 0, 10, pitch=0, yaw=30, roll=0, scale=2, interval= 10)

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
$ pip install voxelamming
$ sample/python
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
$ sample/javaScript
$ npm install
$ node main.mjs
```

### Ruby

#### スクリプト

```ruby
# Ruby
require 'voxelamming_gem'

room_name = '1000'
build_box = VoxelammingGem::BuildBox.new(room_name)

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
$ sample/ruby
$ gem install voxelamming_gem
$ ruby main.rb
```

### Swift

#### スクリプト

```swift
// Swift
import Foundation

if #available(iOS 15.0, macOS 12.0, *) {
    let roomName = "1000"
    let buildBox = BuildBox(roomName: roomName)
    buildBox.setBoxSize(0.5)
    buildBox.setBuildInterval(0.01)

    Task {
        do {
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

            try await buildBox.sendData()
        } catch {
            print("An error occurred: \(error)")
        }
    }

    RunLoop.main.run(until: Date(timeIntervalSinceNow: 10)) // Or longer depending on your needs
} else {
    fatalError("This script requires iOS 15.0 / macOS 12.0 or later.")
}

```

#### 実行方法

```bash
$ cd sample/swift/main
$ swift run
```

## ショーケース

ボクセラミングで作成できる作品例を紹介します。

### 球体

ボクセルで球体を作成します。radius変数を変更することで、球体の大きさを調整できます。

```python
# Python
from voxelamming import BuildBox

room_name = "1000"
build_box = BuildBox(room_name)

radius = 11

build_box.set_box_size(2)
build_box.set_build_interval(0.01)
build_box.translate(0, radius, 0, pitch=0, yaw=0, roll=0)

for i in range(-radius, radius + 1):
  for j in range(-radius, radius + 1):
    for k in range(-radius, radius + 1):
      if (radius -1 ) ** 2 <= i ** 2 + j ** 2 + k ** 2 < radius ** 2:
        print(i, j, k)
        build_box.create_box(i, j, k, 0, 1, 1)

build_box.send_data()
```
<p align="center"><img src="https://creativival.github.io/voxelamming/image/square_sample.png" alt="square_sample" width="50%"/></p>

### ノードの配置

ボクセラミングは、ノードを配置することで、3D空間に構造を作成することができます。

ノードには、位置情報を指定することができます。

```python
# Python
import time
from voxelamming import BuildBox

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
  build_box.translate(-25 + i * 10, 0, 0, pitch=0, yaw=0, roll=0)
  build_box.send_data()
  time.sleep(1)
```

<p align="center"><img src="https://creativival.github.io/voxelamming/image/move_sample.png" alt="move_sample" width="50%"/></p>

### ノードの回転

ボクセラミングは、ノードを回転させることができます。pitch、yaw、rollの値を変更することで、X軸、Y軸、Z軸を中心に回転します。

```python
# Python
import time
from voxelamming import BuildBox

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

  build_box.translate(0, 0, 0, pitch=pitch, yaw=yaw, roll=roll)
  build_box.send_data()
  time.sleep(1)

```
<p align="center"><img src="https://creativival.github.io/voxelamming/image/rotation_sample.png" alt="rotation_sample" width="50%"/></p>

### ノードのアニメーション

ノードのアニメーションは、位置やサイズ、回転を実行できます。アニメーションの間隔（interval）を変更することで、アニメーションの速度を調整できます。

```python
# Python
import time
from voxelamming import BuildBox

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

build_box.animate(10, 0, 0, pitch=0, yaw=30, roll=0, scale=2, interval=10)
build_box.send_data()
```
<p align="center"><img src="https://creativival.github.io/voxelamming/image/animation_sample.png" alt="animation_sample" width="50%"/></p>

### グローバルアニメーション

グローバルアニメーションは、全てのノードをアニメーションさせます。位置、回転、スケール、アニメーションの間隔（interval）を指定することができます。

```python
# Python
from time import sleep
from voxelamming import BuildBox

room_name = "1000"
build_box = BuildBox(room_name)

build_box.set_box_size(0.3)
build_box.set_build_interval(0.01)

for i in range(10):
  build_box.create_box(-1, i, 0, r=0, g=1, b=1, alpha=1)
  build_box.create_box(0, i, 0, r=1, g=0, b=0, alpha=1)
  build_box.create_box(1, i, 0, r=1, g=1, b=0, alpha=1)
  build_box.create_box(2, i, 0, r=0, g=1, b=1, alpha=1)

for i in range(5):
  build_box.remove_box(0, i * 2 + 1, 0)
  build_box.remove_box(1, i * 2, 0)

node_positions = [
  [0, 0, 0],
  [-10, 0, 0],
  [10, 0, 0],
  [0, -20, 0],
  [0, 20, 0],
  [0, 0, -10],
  [0, 0, 10]

]

for x, y, z in node_positions:
  build_box.translate(x, y, z, pitch=0, yaw=0, roll=0)
  build_box.send_data()
  sleep(1)

build_box.animate_global(0, 0, 0, pitch=0, yaw=180, roll=0, scale=1, interval=100)
build_box.send_data()
```
<p align="center"><img src="https://creativival.github.io/voxelamming/image/global_animation_sample.png" alt="animation_sample" width="50%"/></p>

### 文字表示

ボクセルで文字を表示します。文字列、位置、色、透明度を指定することができます。フォントは、日本語、英語、数字に対応しています。

```python
# Python
import time
from voxelamming import BuildBox

room_name = "1000"
build_box = BuildBox(room_name)

build_box.set_box_size(0.5)
build_box.set_build_interval(0.01)

build_box.translate(0, 16, 0, pitch=0, yaw=0, roll=0)
build_box.write_sentence("Hello World", 0, 0, 0, r=1, g=0, b=0, alpha=1)
build_box.send_data()

time.sleep(1)

build_box.translate(0, 0, 0, pitch=0, yaw=0, roll=0)
build_box.write_sentence("こんにちは", 0, 0, 0, r=0, g=1, b=0, alpha=1)
build_box.send_data()
```
<p align="center"><img src="https://creativival.github.io/voxelamming/image/sentence_sample.png" alt="sentence_sample" width="50%"/></p>

### 地図

ボクセルで地図を作成します。地図データは、地理院地図の標高データを使用しています。地図データは、CSVファイルから読み込んで、ボクセルに変換します。

```python
from voxelamming import BuildBox
from map_util import get_map_data_from_csv, get_box_color

room_name = "1000"
build_box = BuildBox(room_name)

build_box.set_box_size(1)
build_box.set_build_interval(0.001)
build_box.set_command('liteRender')

column_num, row_num = 257, 257
csv_file = 'map_38_138_100km.csv'
height_scale = 100
high_color = (0.5, 0, 0)
low_color = (0, 1, 0)
map_data = get_map_data_from_csv(csv_file, height_scale)
boxes = map_data['boxes']
max_height = map_data['maxHeight']
# skip = 1  # high power device
skip = 2  # normal
# skip = 4  # low power device


for j in range(row_num // skip):
  for i in range(column_num // skip):
    print(i, j)
    x = i - column_num // (skip * 2)
    z = j - row_num // (skip * 2)
    y = boxes[j * skip][i * skip]
    r, g, b = get_box_color(y, max_height, high_color, low_color)

    if y > 0:
        build_box.create_box(x, y, z, r, g, b, 1)

build_box.send_data()

```
<p align="center"><img src="https://creativival.github.io/voxelamming/image/japan_map.png" alt="japan_map" width="50%"/></p>


### MagicaVoxelで作成したモデルの表示

MagicaVoxelで作成したボクセルアートをインポートできます。PLY形式でMagicaVoxelのボクセルアートをエクスポートし、ボクセラミングにインポートします。

```python
# Python
from voxelamming import BuildBox
from ply_util import get_boxes_from_ply

room_name = "1000"
build_box = BuildBox(room_name)

build_box.set_box_size(1)
build_box.set_build_interval(0.01)

ply_file_name = 'piyo.ply'

boxes = get_boxes_from_ply(ply_file_name)

for box in boxes:
    build_box.create_box(*box)

build_box.send_data()
```
<p align="center"><img src="https://creativival.github.io/voxelamming/image/voxel_model.png" alt="voxel_model" width="50%"/></p>

### 透明ボクセル

ボクセルの透明度を設定することができます。透明度は、0から1までの値で指定します。

```python
# Python
from voxelamming import BuildBox

room_name = "1000"
build_box = BuildBox(room_name)

build_box.set_box_size(0.3)
build_box.set_build_interval(0.01)
build_box.translate(0, 0, 0, pitch=0, yaw=0, roll=0)
build_box.animate(0, 0, 10, pitch=0, yaw=30, roll=0, scale=2, interval= 0)

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
<p align="center"><img src="https://creativival.github.io/voxelamming/image/set_alpha_sample.png" alt="set_alpha_sample" width="50%"/></p>

### 線を引く

2つの点を指定することで、線分を引きます。線の色を指定できます。floatコマンドを使用することで、滑らかな線を引くことができます。

```python
# Python
import time
from voxelamming import BuildBox

room_name = "1000"
build_box = BuildBox(room_name)

build_box.set_box_size(0.5)
build_box.set_build_interval(0.01)
# build_box.set_command('float')

build_box.draw_line(0, 0, 0, 5, 10, 20, r=1, g=0, b=0, alpha=1)
build_box.send_data()

build_box.send_data()
```
<p align="center"><img src="https://creativival.github.io/voxelamming/image/draw_line.png" alt="draw_line" width="50%"/></p>

### 形状を変更（立方体、球体、平面）

ボクセルの形状を変更することができます。形状は、立方体、球体、平面に対応しています。

```python
# Python
import time
from voxelamming import BuildBox

room_name = "1000"
build_box = BuildBox(room_name)

build_box.set_box_size(0.5)
build_box.set_build_interval(0.01)

for i in range(10):
  build_box.create_box(-1, i, 0, r=0, g=1, b=1, alpha=1)
  build_box.create_box(0, i, 0, r=1, g=0, b=0, alpha=1)
  build_box.create_box(1, i, 0, r=1, g=1, b=0, alpha=1)
  build_box.create_box(2, i, 0, r=0, g=1, b=1, alpha=1)

for i in range(5):
  build_box.remove_box(0, i * 2 + 1, 0)
  build_box.remove_box(1, i * 2, 0)

build_box.send_data()

time.sleep(1)

build_box.translate(10, 0, 0, pitch=0, yaw=0, roll=0)
build_box.change_shape('sphere')
build_box.send_data()

time.sleep(1)

build_box.translate(20, 0, 0, pitch=0, yaw=0, roll=0)
build_box.change_shape('plane')
build_box.send_data()
```
<p align="center"><img src="https://creativival.github.io/voxelamming/image/change_shape.png" alt="change_shape" width="50%"/></p>

### マテリアル（材質）を変更

マテリアルは、金属のような光沢感や、粗さを設定することができます。金属感（is_metallic）をtrueにすると、鏡のように環境を反射します。粗さ（roughness）は、表面の粗さを0から１で設定します。

```python
# Python
from time import sleep
from voxelamming import BuildBox

room_name = "1000"
build_box = BuildBox(room_name)

build_box.set_box_size(1)
build_box.set_build_interval(0.01)

colors = [
  [0, 0, 0],
  [1, 0, 0],
  [0, 1, 0],
  [0, 0, 1],
  [1, 1, 0],
  [1, 0, 1],
  [0, 1, 1],
  [1, 1, 1],
  [0.5, 0.5, 0.5],
  [0.5, 0, 0],
  [0, 0.5, 0],
  [0, 0, 0.5],
  [0.5, 0.5, 0],
  [0.5, 0, 0.5],
]

for i, color in enumerate(colors):
  build_box.create_box(0, i, 0, *color, alpha=1)

for i in range(5):
  build_box.change_material(is_metallic=False, roughness=0.25 * i)
  build_box.translate(i, 0, 0, pitch=0, yaw=0, roll=0)
  build_box.send_data()
  sleep(1)


for i in range(5):
  build_box.change_material(is_metallic=True, roughness=0.25 * i)
  build_box.translate(5 + i, 0, 0, pitch=0, yaw=0, roll=0)
  build_box.send_data()
  sleep(1)
```
<p align="center"><img src="https://creativival.github.io/voxelamming/image/change_material.png" alt="change_material" width="50%"/></p>

### ライト (iOSのみ)

光源（ライト）を配置できます。ライトの位置、色、強度、光の種類（directional, spot, point）を設定できます。

```python
# Python
from voxelamming import BuildBox

room_name = "1000"
build_box = BuildBox(room_name)

build_box.set_command('axis')
build_box.set_box_size(1)
build_box.set_build_interval(0.01)

colors = [
  [0, 0, 0],
  [1, 0, 0],
  [0, 1, 0],
  [0, 0, 1],
  [1, 1, 0],
  [1, 0, 1],
  [0, 1, 1],
  [1, 1, 1],
  [0.5, 0.5, 0.5],
  [0.5, 0, 0],
  [0, 0.5, 0],
  [0, 0, 0.5],
  [0.5, 0.5, 0],
  [0.5, 0, 0.5],
]

for i, color in enumerate(colors):
  build_box.create_box(0, i, 0, *color, alpha=1)

build_box.set_light(1, 1, 0, r=1, g=0, b=0, alpha=1, intensity=20000, interval=2, light_type='directional')
build_box.set_light(0, 1, 1, r=0, g=1, b=0, alpha=1, intensity=20000, interval=3, light_type='spot')
build_box.set_light(-1, 1, 0, r=0, g=0, b=1, alpha=1, intensity=20000, interval=5, light_type='point')

build_box.send_data()
```
<p align="center"><img src="https://creativival.github.io/voxelamming/image/light_sample.png" alt="light_sample" width="50%"/></p>

### コマンド

コマンドは、特定のアクションを実行するための指示です。コマンドを使用することで、特定のアクションを実行できます。japaneseCastleコマンドは、日本の城を建築できます。

```python
# Python
from voxelamming import BuildBox

room_name = "1000"
build_box = BuildBox(room_name)

build_box.set_command('japaneseCastle')

build_box.send_data()
```
<p align="center"><img src="https://creativival.github.io/voxelamming/image/command_sample.png" alt="command_sample" width="50%"/></p>

### リセットコマンド

リセットコマンドは、ボクセルをすべて削除します。モデルの作成とリセットを交互に繰り返すことで、モデルのアニメーションを作成できます。

```python
# Python
from time import sleep
from voxelamming import BuildBox
from ply_util import get_boxes_from_ply

room_name = "1000"
build_box = BuildBox(room_name)


animation_settings = [
    {
        'model': 'frog1.ply',
        'position': [0, 0, 0, 0, 0, 0],
    },
    {
        'model': 'frog2.ply',
        'position': [0, 0, 0, 0, 0, 0],
    },
    {
        'model': 'frog3.ply',
        'position': [0, 0, 0, 0, 0, 0],
    },
    {
        'model': 'frog4.ply',
        'position': [0, 5, 0, 0, 0, 0],
    },
    {
        'model': 'frog5.ply',
        'position': [0, 10, 0, 0, 0, 0],
    },
    {
        'model': 'frog4.ply',
        'position': [0, 5, 0, 0, 0, 0],
    },
    {
        'model': 'frog3.ply',
        'position': [0, 0, 0, 0, 0, 0],
    },
    {
        'model': 'frog2.ply',
        'position': [0, 0, 0, 0, 0, 0],
    },
]

for _ in range(3):
    for i in range(len(animation_settings)):
        model = animation_settings[i]['model']
        position = animation_settings[i]['position']

        for box in get_boxes_from_ply(model):
            build_box.create_box(*box)

        build_box.set_box_size(0.5)
        build_box.set_build_interval(0)
        build_box.translate(*position)
        build_box.send_data()
        sleep(0.5)

        build_box.clear_data()
        build_box.set_command('reset')
        build_box.send_data()
        build_box.clear_data()
        sleep(0.5)
```
<p align="center"><img src="https://creativival.github.io/voxelamming/image/reset_command.png" alt="reset_command" width="50%"/></p>

### フロートコマンド

フロートコマンドは、、ボクセルの配置位置を0.01単位で精密に配置できるようになります（通常は1単位）。

```python
# Python
from time import sleep
from math import sin, cos, radians, pi, sqrt
from voxelamming import BuildBox

room_name = "1000"
size = 1
radius = 1.5
repeat_count = 100

build_box = BuildBox(room_name)
build_box.set_build_interval(0.01)
build_box.set_box_size(size)
build_box.change_shape("sphere")
build_box.set_command('float')

for i in range(repeat_count):
  angle = radians(i * 720 / repeat_count)
  x = radius * cos(angle)
  y = i
  z = radius * sin(angle)

  build_box.create_box(x, y, z, r=0, g=1, b=1, alpha=1)
  build_box.create_box(-x, y, -z, r=0, g=1, b=1, alpha=1)
  if i % 2 == 0:
    build_box.create_box(x / 3, y, z / 3, r=1, g=0, b=0, alpha=1)
  else:
    build_box.create_box(-x / 3, y, -z / 3, r=1, g=1, b=0, alpha=1)

build_box.send_data()
```
<p align="center"><img src="https://creativival.github.io/voxelamming/image/float_command.png" alt="float_command" width="50%"/></p>

### 座標系の保存と復元

座標系（マトリックス）を保存し、復元することができます。push_matrixコマンドで座標系を保存し、pop_matrixコマンドで座標系を復元します。この例は、マトリックスを使って、再起的にフラクタルツリーを作成しています。

```python
# Python
from time import sleep

from voxelamming import BuildBox


def draw_three_branches(count, branch_length):
    count -= 1
    if count < 0:
        return

    # draw branches
    shorted_branch_length = branch_length * length_ratio
    print('push_matrix')
    build_box.push_matrix()

    # first branch
    build_box.translate(0, branch_length, 0, pitch=angle_to_open, yaw=0, roll=0)
    build_box.draw_line(0, 0, 0, 0, shorted_branch_length, 0, r=1, g=0, b=1)
    draw_three_branches(count, shorted_branch_length)

    # second branch
    build_box.translate(0, branch_length, 0, pitch=angle_to_open, yaw=120, roll=0)
    build_box.draw_line(0, 0, 0, 0, shorted_branch_length, 0, r=1, g=0, b=0)
    draw_three_branches(count, shorted_branch_length)

    # third branch
    build_box.translate(0, branch_length, 0, pitch=angle_to_open, yaw=240, roll=0)
    build_box.draw_line(0, 0, 0, 0, shorted_branch_length, 0, r=1, g=1, b=0)
    draw_three_branches(count, shorted_branch_length)

    print('pop_matrix')
    build_box.pop_matrix()


room_name = "1000"
build_box = BuildBox(room_name)
initial_length = 10
repeat_count = 5
angle_to_open = 30
length_ratio = 0.8

build_box.change_shape('sphere')
build_box.set_command('float')
build_box.draw_line(0, 0, 0, 0, initial_length, 0, r=0, g=1, b=1)

draw_three_branches(repeat_count, initial_length)
build_box.send_data()
```
<p align="center"><img src="https://creativival.github.io/voxelamming/image/push_matrix.png" alt="push_matrix" width="50%"/></p>

### テクスチャー

ボクセルのテクスチャーを設定できます、テクスチャーは、画像を指定することで、ボクセルに貼り付けることができます。"grass", "stone", "dirt", "planks", "bricks"のテクスチャーが用意されています。

```python
# Python
from time import sleep
from voxelamming import BuildBox

texture_names = ["grass", "stone", "dirt", "planks", "bricks"]
room_name = "1000"
build_box = BuildBox(room_name)

build_box.set_box_size(1)
build_box.set_build_interval(0.01)

for i, texture in enumerate(texture_names):
    build_box.create_box(0, len(texture_names) - i - 1, 0, texture=texture)

build_box.send_data()
build_box.clear_data()
sleep(1)

build_box.set_box_size(1)
build_box.set_build_interval(0.01)
build_box.change_shape('sphere')
for i, texture in enumerate(texture_names):
    build_box.create_box(1, len(texture_names) - i - 1, 0, texture=texture)

build_box.send_data()
build_box.clear_data()
sleep(1)

build_box.set_box_size(1)
build_box.set_build_interval(0.01)
build_box.change_shape('plane')
for i, texture in enumerate(texture_names):
    build_box.create_box(2, len(texture_names) - i - 1, 0, texture=texture)

build_box.send_data()
build_box.clear_data()

```
<p align="center"><img src="https://creativival.github.io/voxelamming/image/texture.png" alt="texture" width="50%"/></p>

### フレームアニメーション

複数のフレームを記録して、アニメーションを実行できます。アニメーションのFPSと繰り返し回数を指定できます。

```python
# Python
from math import sin, cos, radians
from voxelamming import BuildBox

rainbow_colors = [
    [255, 0, 0],     # 赤
    [255, 165, 0],   # オレンジ
    [255, 255, 0],   # 黄色
    [0, 128, 0],     # 緑
    [0, 255, 255],   # 水色
    [0, 0, 255],     # 青
    [128, 0, 128],    # 紫
    [128, 0, 128]    # 紫
]
butterfly_list = [
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
     0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
     0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
     1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0,
     0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
     0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0,
     0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
     0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
     0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0,
     0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
     0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
     0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1,
     0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
     0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
     0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0,
     0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
     0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
     0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0,
     0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
     0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
     0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1,
     0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
     0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
     0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0,
     0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
     0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
     0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0,
     0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
     0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
     0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0,
     0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
     0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
     0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0,
     0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
     0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
     0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
     1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0,
     0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
     0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
     0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0,
     0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
     0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
     0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0,
     0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
     0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
     0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [1, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0,
     0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
     0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
     0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0,
     0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
     0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
     0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0,
     0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
     0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
     0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0,
     0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
     0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
     0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0,
     0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
     0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
     0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0,
     0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
     0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
     0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0,
     0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
     0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
     0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0,
     0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
     0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
     0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0,
     0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
     0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
     0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0,
     0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
     0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
     0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0,
     0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
     0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
     0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0,
     0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
     0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
]

# ルームネームを設定
room_name = "1000"
build_box = BuildBox(room_name)
build_box.set_box_size(0.15)
# build_box.set_build_interval(0.01)
build_box.set_command('float')
build_box.set_frame_fps(2)
build_box.set_frame_repeats(10)

for angle in [30, 15, 0, -15, -30, -15, 0, 15]:
    build_box.frame_in()
    build_box.translate(0, 100, 0, 30, 0, 0)

    for j, row in enumerate(butterfly_list):
        color = rainbow_colors[j // 10]

        for i, dot in enumerate(row):
            if dot != 0:
                x = i * cos(radians(angle))
                y = -j
                z = i * sin(radians(angle))
                r = color[0] / 255
                g = color[1] / 255
                b = color[2] / 255
                build_box.create_box(x, y, z, r, g, b)
                build_box.create_box(-x, y, z, r, g, b)
    build_box.frame_out()

# データを送信
build_box.send_data()
```

<p align="center"><img src="https://creativival.github.io/voxelamming/image/frame_animation.png" alt="frame_animation" width="50%"/></p>

## 設定

アプリ右上の「Settings」ボタンから設定画面を開けます。デバッグモードをオフにすると、画面の情報表示が無効になります。

## ARワールドのリセット

アプリ右下の「リセット」ボタンから、ARワールドをリセットできます。リセットすると、全てのボクセルが削除されます。

## ユーザー共有

準備中

## ライセンス

[MIT License](https://github.com/creativival/voxelamming/blob/master/LICENSE)

## 作者

creativival

## コンタクト

[コンタクト](https://creativival.github.io/voxelamming/contact.html)

## プライバシーポリシー

[プライバシーポリシー](https://creativival.github.io/voxelamming/privacy.html)

