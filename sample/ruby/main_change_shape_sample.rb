require 'voxelamming'
# require_relative 'voxelamming'

room_name = '1000'
vox = Voxelamming::VoxelammingManager.new(room_name)
# vox = VoxelammingManager.new(room_name)

vox.set_box_size(0.5)
vox.set_build_interval(0.01)

for i in 0...10
  vox.create_box(-1, i, 0, r: 0, g: 1, b: 1)
  vox.create_box(0, i, 0, r: 1, g: 0, b: 0)
  vox.create_box(1, i, 0, r: 1, g: 1, b: 0)
  vox.create_box(2, i, 0, r: 0, g: 1, b: 1)
end

for i in 0...5
  vox.remove_box(0, i * 2, 0)
  vox.remove_box(1, i * 2 + 1, 0)
end

vox.send_data

sleep 1

vox.transform(10, 0, 0)
vox.change_shape('sphere')
vox.send_data

sleep 1

vox.transform(20, 0, 0)
vox.change_shape('plane')
vox.send_data
