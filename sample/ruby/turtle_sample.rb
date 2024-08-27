require 'voxelamming'
# require_relative 'voxelamming'
# require_relative 'turtle'

room_name = "1000"
vox = Voxelamming::VoxelammingManager.new(room_name)
# vox = VoxelammingManager.new(room_name)

vox.set_box_size(0.3)
vox.set_build_interval(0.01)
t = Voxelamming::Turtle.new(vox)
# t = Turtle.new(vox)

t.set_color(1, 1, 0, 1)

t.forward(10)
t.left(90)
t.forward(10)
t.left(90)
t.forward(10)
t.left(90)
t.forward(10)
t.left(90)

t.up(90)
t.forward(10)
t.down(90)

t.forward(10)
t.left(90)
t.forward(10)
t.left(90)
t.forward(10)
t.left(90)
t.forward(10)

vox.send_data()
