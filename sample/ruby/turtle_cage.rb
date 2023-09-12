require_relative 'build_box'
require_relative 'turtle'

room_name = "1000"
build_box = BuildBox.new(room_name)

build_box.set_box_size(0.3)
build_box.set_build_interval(0.01)
build_box.set_command('liteRender')
t = Turtle.new(build_box)

colors = [
  [0, 0, 0, 1],
  [1, 0, 0, 1],
  [0, 1, 0, 1],
  [0, 0, 1, 1],
  [1, 1, 0, 1],
  [0, 1, 1, 1],
  [1, 0, 1, 1],
  [1, 1, 1, 1],
  [0.5, 0, 0, 1],
  [0, 0.5, 0, 1],
  [0, 0, 0.5, 1],
  [0.5, 0.5, 0, 1],
  [0, 0.5, 0.5, 1],
  [0.5, 0, 0.5, 1],
  [0.5, 0.5, 0.5, 1],
]

colors.each_with_index do |color, j|
  polar_phi = j * 180.0 / colors.length
  t.reset
  t.set_color(*color)
  t.left(polar_phi)

  60.times do
    t.forward(4)
    t.up(6)
  end
end

build_box.send_data
