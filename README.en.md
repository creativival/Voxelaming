# Voxelamming - A Programming Learning App Using ARKit

<p align="center"><img src="https://creativival.github.io/voxelamming/image/voxelamming_ladder.png" alt="VoxelLadder" width="100%"/></p>

[//]: # (<p align="center"><video width="1280" height="720" controls>)

[//]: # (    <source src="video/voxelamming_top_video.mp4" type="video/mp4">)

[//]: # (</video></p>)


*Read this in other languages: [English](README.en.md), [日本語](README.md)*

## What is voxelamming?

voxelamming = Voxel + Programming

voxelamming is a programming learning app that uses ARKit. It can be used for free on ARKit-compatible iPhones and iPads (iOS 13 and above). You can have fun placing voxels (the smallest units in 3D space, similar to pixels) in a virtual space that you have programmed on your computer.

## How to Use

### Preparing Your Computer

Both Windows and Mac are supported. If the programming language (Python, Node.js, Ruby, Swift) is not installed on your computer, please install the language you want to use. Data communication between the computer and the device (iPhone, iPad) uses an Internet connection (they do not need to be connected to the same network). Once this is done, your computer is ready.

### Placing a Plane Anchor

Launch the voxelamming app. The first time you launch the app, it will ask for permission to use the camera, please grant it by selecting "Yes". Once the camera is launched, ARKit will automatically search for a real-world plane. When the plane detection marker (red-green-blue coordinate axes) appears, tap the screen to place a plane anchor. The plane anchor is made up of black and white tiles. With this, you are ready to place voxels.

### Designing (Programming) Voxels

On your computer (Windows, Mac), program the "voxel data" for placing the voxels. The voxel data includes information such as "location, color, size, and placement interval". The supported languages are Scratch3 MOD, Python, JavaScript (Node.js), Ruby, and Swift.

Create a script. First, set the room name to connect to the WebSocket server room. The room name is the string displayed in the center of the device (iPhone, iPad) screen. Assign the room name to the variable room_name (roomName).

Then, use the loop and conditional expressions of each language to create voxel data. The position of the voxel is specified by the x, y, and z axis values, with the plane anchor as the reference. The x-axis represents left and right, the y-axis represents up and down, and the z-axis represents depth (the front is positive) (the unit is centimeters). The size of the voxel is specified as a decimal based on 1.0 cm. The color is specified as a decimal from 0 to 1 in RGB values. Then, specify the interval at which voxels are placed in seconds. By specifying the interval at which voxels are placed, the voxels will be placed over time instead of all at once.

### Placing AR Voxels

When you run the script, the voxel data is sent to the device (iPhone, iPad) via WebSocket communication. Once the data is received, AR voxels are placed based on the plane anchor on the device screen.

If the WebSocket server is on break, data transmission may fail. In that case, please wait for a while and try again.

## Explanation of Methods

I will explain the methods to use in the script. The method names for each language are as follows.

* set_box_size(size): Sets the size of the voxel. The unit is centimeters. The default is 1.0.
* set_build_interval(interval): Sets the interval (interval) for placing the voxel. The unit is seconds. The default is 0.01.
* create_box(x, y, z, r, g, b): Places a voxel. Specify the x, y, and z axis positions and the color. The color is specified as a decimal from 0 to 1 in RGB values.
* remove_box(x, y, z): Deletes a voxel. Specify the x, y, and z axis positions. (If there is no voxel at the specified position, nothing will be done)
* write_sentence(sentence, x, y, z, r, g, b): Writes a single line sentence in voxel. Specify the x, y, and z axis positions and the color in RGB values. The color is specified as a decimal from 0 to 1 in RGB values.
* send_data(): Sends the voxel data to the device (iPhone, iPad).
* clear_data(): Initializes the voxel data. The size and interval are also reset. (After sending, the voxel data is
  reset if you want.)
* set_node(x, y, z, pitch, yaw, roll): Specifies the position (x, y, z) and angle (pitch, yaw, roll) of the node that groups the voxels.
* animate_node(x, y, z, pitch, yaw, roll, scale, interval): Animates the node. Specify movement (x, y, z), rotation (pitch, yaw, roll), enlargement (scale), and placement interval (interval).

Please read snake_case as camelCase. (set_box_size -> setBoxSize)

## Script Examples

You can try examples of scripts in [the sample folder](https://github.com/creativival/voxelamming/tree/main/sample). When you run the following script, a voxel like the image will be placed.

### Scratch3 MOD

Load the voxelamming extension and create a script.

[Play the sample project in Xcratch](https://xcratch.github.io/editor/#https://creativival.github.io/voxelamming-extension/projects/example.sb3)

<p align="center"><img src="https://creativival.github.io/voxelamming/image/voxelamming_scratch3.png" alt="voxelamming_scratch3" width="100%"/></p>

### Python (3.6+)

#### Script

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

#### Run script

```bash
$ python main.py

or  

$ python3 main.py
```

### JavaScript (Node.js)

#### Script

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

#### Run script

```bash
$ node main.mjs
```

### Ruby

#### Script

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

#### Run script

```bash
$ ruby main.rb
```

### Swift

#### Script

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

#### Run script

```bash
$ cd swift/Sources
$ swift run
```
## Showcase

Only Python is demonstrated. Please translate for other languages.

### Square

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

### Node move

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

### Node rotation

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


### Node animation

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

### Write sentence

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

### Map

<p align="center"><img src="https://creativival.github.io/voxelamming/image/japan_map.png" alt="sentence" width="50%"/></p>

```python
from build_box import BuildBox
from map_util import get_map_data_from_csv, get_box_color

room_name = "1000"
build_box = BuildBox(room_name)

build_box.set_box_size(0.1)
build_box.set_build_interval(0.001)

column_num, row_num = 257, 257
csv_file = 'map_38_138_100km.csv'
height_scale = 100
high_color = (0.5, 0, 0)
low_color = (0, 1, 0)
map_data = get_map_data_from_csv(csv_file, height_scale)
boxes = map_data['boxes']
max_height = map_data['maxHeight']
# skip = 1  # high power device
skip = 2  # normal device
# skip = 4  # low power device


for j in range(row_num // skip):
  for i in range(column_num // skip):
    print(i, j)
    x = i
    z = j
    y = boxes[j * skip][i * skip]

    if y >= 0:
      r, g, b = get_box_color(y, max_height, high_color, low_color)
      build_box.create_box(x, y, z, r, g, b, 1)

build_box.send_data()
```

### Model created by MagicaVoxel

<p align="center"><img src="https://creativival.github.io/voxelamming/image/voxel_model.png" alt="sentence" width="50%"/></p>

```python
from build_box import BuildBox
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

### Transparency

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

### Draw line

<p align="center"><img src="https://creativival.github.io/voxelamming/image/draw_line.png" alt="sentence" width="50%"/></p>

```python
import time
from build_box import BuildBox

room_name = "1000"
build_box = BuildBox(room_name)

build_box.set_box_size(0.5)
build_box.set_build_interval(0.01)

build_box.draw_line(0, 0, 0, 5, 10, 20, r=1, g=0, b=0, alpha=1)
build_box.send_data()

build_box.send_data()
```

### Change shape (box, sphere, plane)

<p align="center"><img src="https://creativival.github.io/voxelamming/image/change_shape.png" alt="sentence" width="50%"/></p>

```python
import time
from build_box import BuildBox

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

build_box.set_node(10, 0, 0, pitch=0, yaw=0, roll=0)
build_box.change_shape('sphere')
build_box.send_data()

time.sleep(1)

build_box.set_node(20, 0, 0, pitch=0, yaw=0, roll=0)
build_box.change_shape('plane')
build_box.send_data()
```

### User Sharing

TED

## Settings

You can navigate to the settings screen from the 'Settings' button in the top right corner of the screen. Turning off debug mode will disable the display of information on the screen.

## Reset AR World

You can reset the AR world by pressing the 'Reset' button in the top right corner of the screen.

## License

[MIT License](https://github.com/creativival/voxelamming/blob/master/LICENSE)

## Author

creativival

## Contact

[Contact](https://creativival.github.io/voxelamming/contact.en.html)

## Privacy Policy

[Contact](https://creativival.github.io/voxelamming/privacy.en.html)


