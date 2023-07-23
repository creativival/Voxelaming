import BuildBox from './buildBox.mjs';

let room_name = "1000";
let build_box = new BuildBox(room_name);

build_box.setCommand('axis');
build_box.setBoxSize(1);
build_box.setBuildInterval(0.01);

let colors = [
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
  [0, 0.5, 0.5],
];

for(let i = 0; i < colors.length; i++){
  let color = colors[i];
  build_box.createBox(0, i, 0, color[0], color[1], color[2], 1);
}

build_box.setLight(1, 1, 0, 1, 0, 0, 1, 1000, 1);
build_box.setLight(0, 1, 1, 0, 1, 0, 1, 1000, 1);

build_box.sendData();
