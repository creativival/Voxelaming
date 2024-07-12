from voxelamming import BuildBox

room_name = "1000"
build_box = BuildBox(room_name)

build_box.set_command('japaneseCastle')

build_box.send_data("castle_command")

