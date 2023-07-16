from build_box import BuildBox
from ply_util import get_positions_from_ply

room_name = "1000"
build_box = BuildBox(room_name)

build_box.set_box_size(1)
build_box.set_build_interval(0.01)
build_box.set_node(0, 0, 0, pitch=0, yaw=0, roll=0)

ply_file_name = 'piyo.ply'

positions = get_positions_from_ply(ply_file_name)

for p in positions:
    build_box.create_box(p[0], p[1], p[2], r=p[3], g=p[4], b=p[5], alpha=1)

build_box.send_data()
