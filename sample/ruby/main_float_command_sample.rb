require 'voxelamming'
# require_relative 'voxelamming'

room_name = "1000"
size = 1.0
radius = 1.5
repeat_count = 100

vox = Voxelamming::VoxelammingManager.new(room_name)
# vox = VoxelammingManager.new(room_name)
vox.set_build_interval(0.01)
vox.set_box_size(size)
vox.change_shape("sphere")
vox.set_command('float')

(0...repeat_count).each do |i|
  angle = Math::PI * i * 720.0 / repeat_count / 180.0  # radians変換
  x = radius * Math.cos(angle)
  y = i
  z = radius * Math.sin(angle)

  vox.create_box(x, y, z, r: 0, g: 1, b: 1, alpha: 1)
  vox.create_box(-x, y, -z, r: 0, g: 1, b: 1, alpha: 1)
  if i.even?
    vox.create_box(x / 3, y, z / 3, r: 1, g: 0, b: 0, alpha: 1)
  else
    vox.create_box(-x / 3, y, -z / 3, r: 1, g: 1, b: 0, alpha: 1)
  end
end

vox.send_data(name: 'float_command_sample')

