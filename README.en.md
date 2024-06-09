# **Voxelamming - AR Programming Learning App**

<p align="center"><img src="https://creativival.github.io/voxelamming/image/voxelamming_icon.png" alt="Voxelamming Logo" width="200"/></p>

Voxelamming is an AR programming learning app. Even programming beginners can learn programming visually and enjoyably. Voxelamming supports iPhones and iPads with iOS 16 or later, and Apple Vision Pro.

<a href="https://apps.apple.com/jp/app/%E3%83%9C%E3%82%AF%E3%82%BB%E3%83%A9%E3%83%9F%E3%83%B3%E3%82%B0/id6451427658?itsct=apps_box_badge&amp;itscg=30200" style="display: inline-block; overflow: hidden; border-radius: 13px; width: 250px; height: 83px;"><img src="https://tools.applemediaservices.com/api/badges/download-on-the-app-store/black/ja-jp?size=250x83&amp;releaseDate=1690502400" alt="Download on the App Store" style="border-radius: 13px; width: 250px; height: 83px;"></a>

<p align="center"><img src="https://creativival.github.io/voxelamming/image/voxelamming_ladder.png" alt="VoxelLadder" width="50%"/></p>

* Read this in other languages: [English](README.en.md), [日本語](README.md)*

## What is Voxelamming?

Voxelamming = Voxel + Programming

Voxelamming is an app that allows you to learn programming using AR technology. You can place voxels (the smallest unit cube in 3D space) with code and create interactive 3D works.

**Target users:**

* Programming beginners: You can learn the basics of programming while getting visual feedback.
* Generative artists: You can create creative 3D artworks using code.

## Features

* **Intuitive operation with AR:** Placing voxels in the real world enhances spatial awareness while learning programming.
* **Various programming languages:** Supports Scratch3 MOD, Python, JavaScript (Node.js), Ruby, and Swift.
* **Cross-platform:** Works on Windows, Mac, and iOS (iPhone, iPad, Apple Vision Pro).
* **Free:** It is free to download and use.

## How to Use

To use Voxelamming, you need to follow these three steps:

1. **Prepare your device:** You need an iPhone or iPad with iOS 16 or later, or an Apple Vision Pro.
2. **Set the plane anchor:** Launch the app and follow the on-screen instructions to place an anchor on a real-world plane.
3. **Voxel modeling:** Use your computer to create code that specifies the position, color, size, etc. of the voxels and send it to the app.

### 1. Prepare your device

Download and install the Voxelamming app from the App Store.

* iPhone/iPad version: [App Store](https://apps.apple.com/jp/app/%E3%83%9C%E3%82%AF%E3%82%BB%E3%83%A9%E3%83%9F%E3%83%B3%E3%82%B0/id6451427658?itsct=apps_box_link&itscg=30200)
* Apple Vision Pro version: [App Store](https://apps.apple.com/jp/app/%E3%83%9C%E3%82%AF%E3%82%BB%E3%83%A9%E3%83%9F%E3%83%B3%E3%82%B0-%E3%82%B9%E3%82%BF%E3%82%B8%E3%82%AA/id6475821648)

### 2. Set the plane anchor

#### For iPhone/iPad:

1. Launch the Voxelamming app.
2. Upon the first launch, you will be asked for permission to use the camera. Tap "Yes" to allow it.
3. When the camera starts up, AR automatically searches for a real-world plane. When the plane detection mark (red, green, and blue coordinate axes) appears, tap the screen to place the plane anchor. The plane anchor is composed of white and black tiles.

#### For Apple Vision Pro:

1. Launch the Voxelamming Studio app.
2. Tap the "Set Base Anchor" button to set the base anchor. The base anchor is composed of white and black tiles.
3. You can drag the base anchor to move it.

### 3. Voxel modeling (programming)

Create code to place voxels using your computer (Windows or Mac).

1. **Choose a programming language:** You can choose from Scratch3 MOD, Python, JavaScript (Node.js), Ruby, and Swift.
2. **Check the room name of the WebSocket server:** Launch the Voxelamming app on your device and check the room name displayed in the center of the screen.
3. **Refer to the sample code:** Create your own code by referring to the sample code in the [sample folder](https://github.com/creativival/voxelamming/tree/main/sample).

#### Voxel data

Voxel data is data that specifies the position, color, size, etc. of voxels.

* **Position:** Specified by the values of the x, y, and z axes based on the plane anchor (unit is centimeters).
    * x-axis: left and right
    * y-axis: up and down
    * z-axis: depth (front is positive)
* **Size:** Specified as a decimal based on 1.0cm.
* **Color:** Specified by RGB values, as decimals between 0 and 1.
* **Placement interval:** Specifies the interval at which voxels are placed in seconds. Voxels are placed at 0.01 second intervals by default.

**Example: Place a red voxel at the position (x: 10, y: 5, z: -2) with double size.**

```python
# Python
build_box.set_box_size(2.0)  # Set size to double
build_box.create_box(10, 5, -2, 1, 0, 0)  # Place a red voxel
build_box.send_data() # Send data
```

#### Method description

| Method name | Description | Arguments |
|---|---|---|
| `set_room_name(room_name)` | Sets the room name for communicating with the device. | `room_name`: Room name (string) |
| `set_box_size(size)` | Sets the size of the voxel (default: 1.0). | `size`: Size (float) |
| `set_build_interval(interval)` | Sets the placement interval of the voxels (default: 0.01 seconds). | `interval`: Interval (float) |
| `change_shape(shape)` | Changes the shape of the voxel. | `shape`: Shape ("box", "square", "plane") |
| `change_material(is_metallic, roughness)` | Changes the material of the voxel. | `is_metallic`: Whether to make it metallic (boolean), `roughness`: Roughness (float) |
| `create_box(x, y, z, r, g, b, alpha)` | Places a voxel. | `x`, `y`, `z`: Position (float), `r`, `g`, `b`, `alpha`: Color (float, 0-1) |
| `create_box(x, y, z, texture)` | Places a voxel with texture. | `x`, `y`, `z`: Position (float), `texture`: Texture name (string) |
| `remove_box(x, y, z)` | Removes a voxel. | `x`, `y`, `z`: Position (float) |
| `write_sentence(sentence, x, y, z, r, g, b, alpha)` | Draws a string with voxels. | `sentence`: String (string), `x`, `y`, `z`: Position (float), `r`, `g`, `b`, `alpha`: Color (float, 0-1) |
| `set_light(x, y, z, r, g, b, alpha, intensity, interval, light_type)` | Places a light. | `x`, `y`, `z`: Position (float), `r`, `g`, `b`, `alpha`: Color (float, 0-1), `intensity`: Intensity (float), `interval`: Blinking interval (float), `light_type`: Type of light ("point", "spot", "directional") |
| `set_command(command)` | Executes a command. | `command`: Command ("axis", "japaneseCastle", "float", "liteRender") |
| `draw_line(x1, y1, z1, x2, y2, z2, r, g, b, alpha)` | Draws a line between two points. | `x1`, `y1`, `z1`: Starting point (float), `x2`, `y2`, `z2`: Ending point (float), `r`, `g`, `b`, `alpha`: Color (float, 0-1) |
| `send_data()` | Sends voxel data to the device. | |
| `clear_data()` | Initializes voxel data. | |
| `translate(x, y, z, pitch, yaw, roll)` | Moves and rotates the coordinate system of the voxel. | `x`, `y`, `z`: Translation amount (float), `pitch`, `yaw`, `roll`: Rotation amount (float) |
| `animate(x, y, z, pitch, yaw, roll, scale, interval)` | Animates a voxel. | `x`, `y`, `z`: Translation amount (float), `pitch`, `yaw`, `roll`: Rotation amount (float), `scale`: Scale (float), `interval`: Interval (float) |
| `animate_global(x, y, z, pitch, yaw, roll, scale, interval)` | Animates all voxels. | `x`, `y`, `z`: Translation amount (float), `pitch`, `yaw`, `roll`: Rotation amount (float), `scale`: Scale (float), `interval`: Interval (float) |
| `push_matrix()` | Saves the current coordinate system to the stack. | |
| `pop_matrix()` | Restores the coordinate system from the stack. | |
| `frame_in()` | Starts recording a frame. | |
| `frame_out()` | Ends recording a frame. | |
| `set_frame_fps(fps)` | Sets the frame rate (default: 2). | `fps`: Frame rate (int) |
| `set_frame_repeats(repeats)` | Sets the number of frame repetitions (default: 10). | `repeats`: Number of repetitions (int) |

**Notes:**

* The method names above are examples in Python. Method names may differ in other languages.
* Please refer to the sample code for each language for more details.

### 4. Run and check

When you run the code you created, the voxel data is sent to the device and the voxels are built in AR space.

## Sample Script

We have prepared sample scripts in the [sample folder](https://github.com/creativival/voxelamming/tree/main/sample). If you run the following script, voxels like the top image will be placed.

### Scratch3 MOD

Please load the Voxelamming extension and create a script.

[Play the sample project with Xcratch](https://xcratch.github.io/editor/#https://creativival.github.io/voxelamming-extension/projects/example.sb3)

<p align="center"><img src="https://creativival.github.io/voxelamming/image/voxelamming_scratch3_en.png" alt="voxelamming_scratch3" width="100%"/></p>

### Scratch3 MOD (Turtle Programming)

You can use Scratch3 MOD's turtle programming to place voxels. Since you can intuitively place voxels, it is recommended for programming beginners, especially children.

[Play the sample project with Xcratch](https://xcratch.github.io/editor/#https://creativival.github.io/voxelamming-turtle-extension/projects/example.sb3)

<p align="center"><img src="https://creativival.github.io/voxelamming/image/voxelamming_turtle_scratch3_en.png" alt="voxelamming_turtle_scratch3" width="100%"/></p>

### Python (3.6 or higher)

#### Script

```python
# Python
from build_box import BuildBox

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

#### How to run

```bash
$ sample/python
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

#### How to run

```bash
$ sample/javascipt
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

#### How to run

```bash
$ sample/ruby
$ ruby main.rb
```

### Swift

#### Script

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

#### How to run

```bash
$ cd sample/swift/main
$ swift run
```
## Showcase

Here are some examples of works that can be created with Voxelamming.

### Sphere

```python
# Python
from build_box import BuildBox

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

### Node Placement

```python
# Python
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
  build_box.translate(-25 + i * 10, 0, 0, pitch=0, yaw=0, roll=0)
  build_box.send_data()
  time.sleep(1)
```

<p align="center"><img src="https://creativival.github.io/voxelamming/image/move_sample.png" alt="move_sample" width="50%"/></p>

### Node Rotation

```python
# Python
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

  build_box.translate(0, 0, 0, pitch=pitch, yaw=yaw, roll=roll)
  build_box.send_data()
  time.sleep(1)

```
<p align="center"><img src="https://creativival.github.io/voxelamming/image/rotation_sample.png" alt="rotation_sample" width="50%"/></p>

### Node Animation

```python
# Python
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

build_box.animate(10, 0, 0, pitch=0, yaw=30, roll=0, scale=2, interval=10)
build_box.send_data()
```
<p align="center"><img src="https://creativival.github.io/voxelamming/image/animation_sample.png" alt="animation_sample" width="50%"/></p>

### Global Animation

```python
# Python
from time import sleep
from build_box import BuildBox

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

### Text Display

```python
# Python
import time
from build_box import BuildBox

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

### Map

```python
# Python
from build_box import BuildBox

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
<p align="center"><img src="https://creativival.github.io/voxelamming/image/japan_map.png" alt="japan_map" width="50%"/></p>


### Displaying Models Created with MagicaVoxel

You can export your MagicaVoxel voxel art in PLY format and import it into Voxelamming.

```python
# Python
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
<p align="center"><img src="https://creativival.github.io/voxelamming/image/voxel_model.png" alt="voxel_model" width="50%"/></p>

### Transparent Voxel
```python
# Python
from build_box import BuildBox

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

### Drawing a line
```python
# Python
import time
from build_box import BuildBox

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

### Changing the shape (cube, sphere, plane)
```python
# Python
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

build_box.translate(10, 0, 0, pitch=0, yaw=0, roll=0)
build_box.change_shape('sphere')
build_box.send_data()

time.sleep(1)

build_box.translate(20, 0, 0, pitch=0, yaw=0, roll=0)
build_box.change_shape('plane')
build_box.send_data()
```
<p align="center"><img src="https://creativival.github.io/voxelamming/image/change_shape.png" alt="change_shape" width="50%"/></p>

### Changing the material (texture)
```python
# Python
from time import sleep
from build_box import BuildBox

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

### Light (iOS only)
```python
# Python
from build_box import BuildBox

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

### Command
```python
# Python
from build_box import BuildBox

room_name = "1000"
build_box = BuildBox(room_name)

build_box.set_command('japaneseCastle')

build_box.send_data()
```
<p align="center"><img src="https://creativival.github.io/voxelamming/image/command_sample.png" alt="command_sample" width="50%"/></p>

### Reset Command

By alternately repeating the creation and reset of the model, you can create an animation of the model.

```python
# Python
from time import sleep
from build_box import BuildBox
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

### Float Command
```python
# Python
from time import sleep
from math import sin, cos, radians, pi, sqrt
from build_box import BuildBox

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

### Saving and Restoring the Coordinate System
```python
# Python
from time import sleep

from build_box import BuildBox


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

### Texture
```python
# Python
from time import sleep
from build_box import BuildBox

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

### Frame Animation
```python
# Python
from math import sin, cos, radians
from build_box import BuildBox

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

## Settings

You can open the settings screen from the "Settings" button at the top right of the app. Turning off debug mode will disable information display on the screen.

## Resetting the AR World

You can reset the AR world from the "Reset" button at the bottom right of the app.  Resetting will delete all voxels.

## User Sharing

Coming soon

## License

[MIT License](https://github.com/creativival/voxelamming/blob/master/LICENSE)

## Author

creativival

## Contact

[Contact](https://creativival.github.io/voxelamming/contact.html)

## Privacy Policy

[Privacy Policy](https://creativival.github.io/voxelamming/privacy.html)


