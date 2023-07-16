require_relative 'build_box'
require_relative 'ply_util'

room_name = '1000'
build_box = BuildBox.new(room_name)

build_box.set_box_size(0.5)
build_box.set_build_interval(0.01)

ply_file_name = 'piyo.ply'

boxes = get_boxes_from_ply(ply_file_name)
# puts boxes

boxes.each do |box|
  build_box.create_box(*box)
end

build_box.send_data
