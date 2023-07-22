require_relative 'build_box'

room_name = "1000"
build_box = BuildBox.new(room_name)

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
  [0.5, 0, 0.5]
]

colors.each_with_index do |color, i|
  build_box.create_box(0, i, 0, color[0], color[1], color[2], alpha=1)
end

build_box.set_light(1, 1, 0, r=1, g=0, b=0, alpha=1, intensity=1000, interval=1)
build_box.set_light(0, 1, 1, r=0, g=1, b=0, alpha=1, intensity=1000, interval=1)

build_box.send_data()
