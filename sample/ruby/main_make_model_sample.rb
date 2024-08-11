require 'voxelamming'
require_relative 'ply_util'

room_name = '1000'
build_box = Voxelamming::BuildBox.new(room_name)

build_box.set_box_size(0.5)
build_box.set_build_interval(0.01)

ply_file_name = '../ply_file/piyo.ply'

boxes = Voxelamming.get_boxes_from_ply(ply_file_name)
# puts boxes

boxes.each do |b|
  build_box.create_box(b[0], b[1], b[2], r: b[3], g: b[4], b: b[5])
end

build_box.send_data
