require 'voxelamming_gem'

room_name = '1000'
build_box = VoxelammingGem::BuildBox.new(room_name)

build_box.set_command('japaneseCastle')

build_box.send_data
