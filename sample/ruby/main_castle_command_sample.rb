require_relative 'build_box'

room_name = '1000'
build_box = BuildBox.new(room_name)

build_box.set_command('japaneseCastle')

build_box.send_data
