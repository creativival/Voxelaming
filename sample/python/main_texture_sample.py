from time import sleep
from voxelamming import BuildBox

texture_names = ["grass", "stone", "dirt", "planks", "bricks"]
room_name = "1000"
build_box = BuildBox(room_name)

build_box.set_box_size(1)
build_box.set_build_interval(0.01)

for i, texture in enumerate(texture_names):
    build_box.create_box(0, len(texture_names) - i - 1, 0, texture=texture)

build_box.send_data()
build_box.clear_data()
sleep(1)

build_box.set_box_size(1)
build_box.set_build_interval(0.01)
build_box.change_shape('sphere')
for i, texture in enumerate(texture_names):
    build_box.create_box(1, len(texture_names) - i - 1, 0, texture=texture)

build_box.send_data()
build_box.clear_data()
sleep(1)

build_box.set_box_size(1)
build_box.set_build_interval(0.01)
build_box.change_shape('plane')
for i, texture in enumerate(texture_names):
    build_box.create_box(2, len(texture_names) - i - 1, 0, texture=texture)

build_box.send_data()
build_box.clear_data()
