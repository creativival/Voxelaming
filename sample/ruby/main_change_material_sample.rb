require 'voxelamming'

room_name = "1000"
build_box = Voxelamming::BuildBox.new(room_name)

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
  [0, 0.5, 0.5],
]

colors.each_with_index do |color, i|
  build_box.create_box(0, i, 0, r: color[0], g: color[1], b: color[2], alpha: 1)
end

(0..4).each do |i|
  build_box.change_material(is_metallic: false, roughness: 0.25 * i)
  build_box.transform(i, 0, 0, pitch: 0, yaw: 0, roll: 0)
  build_box.send_data()
  sleep(1)
end

(0..4).each do |i|
  build_box.change_material(is_metallic: true, roughness: 0.25 * i)
  build_box.transform(5 + i, 0, 0, pitch: 0, yaw: 0, roll: 0)
  build_box.send_data()
  sleep(1)
end
