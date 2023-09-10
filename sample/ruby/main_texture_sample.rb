require_relative 'build_box'

texture_names = ["grass", "stone", "dirt", "planks", "bricks"]
room_name = "1000"
build_box = BuildBox.new(room_name)

build_box.set_box_size(1)
build_box.set_build_interval(0.01)

texture_names.each_with_index do |texture, i|
  build_box.create_box(0, texture_names.length - i - 1, 0, texture: texture)
end

build_box.send_data()
build_box.clear_data()
sleep(1)

build_box.set_box_size(1)
build_box.set_build_interval(0.01)
build_box.change_shape('sphere')
texture_names.each_with_index do |texture, i|
  build_box.create_box(1, texture_names.length - i - 1, 0, texture: texture)
end

build_box.send_data()
build_box.clear_data()
sleep(1)

build_box.set_box_size(1)
build_box.set_build_interval(0.01)
build_box.change_shape('plane')
texture_names.each_with_index do |texture, i|
  build_box.create_box(2, texture_names.length - i - 1, 0, texture: texture)
end

build_box.send_data()
build_box.clear_data()
