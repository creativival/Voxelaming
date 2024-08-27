require 'voxelamming'
# require_relative 'voxelamming'
# require_relative 'turtle'

room_name = "1000"
vox = Voxelamming::VoxelammingManager.new(room_name)
# vox = VoxelammingManager.new(room_name)

vox.set_box_size(0.3)
vox.set_build_interval(0.001)
vox.set_command('liteRender')
t = Turtle.new(vox)
# t = Turtle.new(vox)

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

colors.each_with_index do |color, i|
  t.reset
  t.set_color(*color)
  t.set_pos(i, 0, 0)
  t.up(4)

  360.times do
    t.forward(3)
    t.left(6)
  end
end

vox.send_data
