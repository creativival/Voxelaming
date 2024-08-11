require 'voxelamming'

room_name = '1000'
build_box = Voxelamming::BuildBox.new(room_name)

build_box.set_box_size(0.5)
build_box.set_build_interval(0.01)

for i in 0...100
  build_box.create_box(-1, i, 0, r: 0, g: 1, b: 1)
  build_box.create_box(0, i, 0, r: 1, g: 0, b: 0)
  build_box.create_box(1, i, 0, r: 1, g: 1, b: 0)
  build_box.create_box(2, i, 0, r: 0, g: 1, b: 1)
end

for i in 0...50
  build_box.remove_box(0, i * 2, 0)
  build_box.remove_box(1, i * 2 + 1, 0)
end

build_box.send_data
