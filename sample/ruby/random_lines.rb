require 'voxelamming'
# require_relative 'voxelamming'

room_name = '1000'
vox = Voxelamming::VoxelammingManager.new(room_name)
# vox = VoxelammingManager.new(room_name)

vox.set_box_size(0.3)
vox.set_build_interval(0.01)
vox.transform(0, 30, 0)

100.times do
  x = SecureRandom.random_number(-30..30)
  y = SecureRandom.random_number(-30..30)
  z = SecureRandom.random_number(-30..30)
  r = SecureRandom.rand
  g = SecureRandom.rand
  b = SecureRandom.rand
  vox.draw_line(0, 0, 0, x, y, z, r: r, g: g, b: b, alpha: 1)
end

vox.send_data()
