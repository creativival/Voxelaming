from build_box import BuildBox
from map_util import get_boxes_from_csv, get_box_color

room_name = "1000"
build_box = BuildBox(room_name)

build_box.set_box_size(0.1)
build_box.set_build_interval(0.001)

column_num, row_num = 257, 257
csv_file = 'map_38_138_100km.csv'
height_scale = 100
high_color = (0, 1, 0)
low_color = (0.5, 0 , 0)
boxes = get_boxes_from_csv(csv_file, height_scale)

for j in range(row_num // 2):
  for i in range(column_num // 2):
    x = i
    z = j
    y = boxes[j * 2][i * 2]
    r, g, b = get_box_color(y, high_color, low_color, height_scale)

    if y > 0:
        build_box.create_box(x, y, z, r, g, b, 1)

build_box.send_data()
