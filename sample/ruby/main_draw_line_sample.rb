require 'voxelamming'
# require_relative 'voxelamming'

room_name = '1000'
vox = Voxelamming::VoxelammingManager.new(room_name)
# vox = VoxelammingManager.new(room_name)

vox.set_box_size(0.5)
vox.set_build_interval(0.01)

vox.draw_line(0, 0, 0, 5, 10, 20, r: 1, g: 0, b: 0, alpha: 1)

vox.send_data
