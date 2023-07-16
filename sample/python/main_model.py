from build_box import BuildBox
from ply_util import get_boxes_from_ply

room_name = "1000"
build_box = BuildBox(room_name)

build_box.set_box_size(1)
build_box.set_build_interval(0.01)
build_box.set_node(0, 0, 0, pitch=0, yaw=0, roll=0)

ply_file_name = 'piyo.ply'

boxes = get_boxes_from_ply(ply_file_name)

for b in boxes:
    build_box.create_box(b[0], b[1], b[2], r=b[3], g=b[4], b=b[5], alpha=b[6])

build_box.send_data()
