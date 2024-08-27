require 'voxelamming'
# require_relative 'voxelamming'
require_relative 'ply_util'

room_name = '1000'
vox = Voxelamming::VoxelammingManager.new(room_name)
# vox = VoxelammingManager.new(room_name)

vox.set_box_size(0.5)
vox.set_build_interval(0.01)

ply_file_name = '../ply_file/piyo.ply'

boxes = Voxelamming.get_boxes_from_ply(ply_file_name)
# puts boxes

boxes.each do |b|
  vox.create_box(b[0], b[1], b[2], r: b[3], g: b[4], b: b[5])
end

vox.send_data(name: 'make_ply_model')
