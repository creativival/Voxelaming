require 'voxelamming'
# require_relative 'voxelamming'
# require_relative 'turtle'

room_name = "1000"
vox = Voxelamming::VoxelammingManager.new(room_name)
# vox = VoxelammingManager.new(room_name)

vox.set_box_size(0.3)
vox.set_build_interval(0.01)
vox.set_command('liteRender')
t = Voxelamming::Turtle.new(vox)
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

vox.send_data()
