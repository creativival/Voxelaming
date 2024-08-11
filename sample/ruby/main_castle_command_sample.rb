require 'voxelamming'

room_name = '1000'
build_box = Voxelamming::BuildBox.new(room_name)

build_box.set_command('japaneseCastle')

build_box.send_data
