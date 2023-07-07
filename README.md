# Voxelaming

![VoxelLadder](image/voxel_ladder.jpeg)

## Voxelamingとは

ARKitを使ったプログラミング学習アプリです。パソコンでプログラムしたボクセル（ピクセルと同様に3D空間における最小単位の正方形）を仮想空間上に配置して遊ぶことができます。

## 使い方

### 平面アンカーの設置

アプリが起動したら、ARKitが平面を探します。平面検知の印が出たら、画面をタップして平面アンカーを設置します。平面アンカーは白と黒のタイルで構成されています。以上でボクセルを設置する準備が整いました。

### ボクセルの配置

パソコン（Windows、Mac）でボクセルを設置する位置をプログラミングします。対応の言語は、Scratch3 MOD、Python、JavaScript (Node.js)、Ruby、Swiftです。プログラムは以下のようになります。

#### Scratch3 MODは準備中です...

```python
# Python
from build_box import BuildBox

room_name = "1000"
build_box = BuildBox()

build_box.clear_boxes()
build_box.set_box_size(0.5)
build_box.set_build_interval(0.01)

for i in range(100):
  build_box.create_box(-1, i, 0, 0, 1, 1)
  build_box.create_box(0, i, 0, 1, 0, 0)
  build_box.create_box(1, i, 0, 1, 1, 0)
  build_box.create_box(2, i, 0, 0, 1, 1)

for i in range(50):
  build_box.remove_box(0, i * 2 + 1, 0)
  build_box.remove_box(1, i * 2, 0)


# for i in range(-10, 11):
#   for j in range(0, 11):
#     for k in range(-10, 11):
#       if i ** 2 + j ** 2 + k ** 2 < 10 ** 2:
#         print(i, j, k)
#         build_box.create_box(i, j, k, 0, 1, 1)

build_box.send_data(room_name)
```

```javascript
// JavaScript (Node.js)
import BuildBox from './buildBox.mjs';

const roomName = '1000';
const buildBox = new BuildBox(roomName);

buildBox.clearData();
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

```ruby
# Ruby
require_relative 'build_box'

build_box = BuildBox.new('1000')
build_box.clear_boxes()
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

```swift
// Swift (リファクタリング中)
import Foundation

let roomName = "1000"

@available(iOS 15.0, macOS 12.0, *)
func main() async {
    do {
        let buildBox = BuildBox()

        buildBox.setSize(0.1)

        for i in 0..<100 {
            buildBox.createBox(-1, Double(i), 0, 0, 1, 1)
            buildBox.createBox(0, Double(i), 0, 1, 0, 0)
            buildBox.createBox(1, Double(i), 0, 1, 1, 0)
            buildBox.createBox(2, Double(i), 0, 0, 1, 1)
        }

        for i in 0..<50 {
            buildBox.removeBox(0, Double(i * 2), 0)
            buildBox.removeBox(1, Double(i * 2 + 1), 0)
        }
        try await buildBox.sendData(roomName: roomName)
    } catch {
        print("An error occurred: \(error)")
    }
}

if #available(iOS 15.0, macOS 12.0, *) {
    Task.detached(priority: .userInitiated) {
        await main()
    }
    RunLoop.main.run(until: Date(timeIntervalSinceNow: 10)) // Or longer depending on your needs
} else {
    fatalError("This script requires iOS 15.0 / macOS 12.0 or later.")
}
```

### ボクセルの削除

準備中

### ボクセルのアニメーション

準備中

## ライセンス

MIT License

## 作者

creativival


