require_relative 'build_box'
require_relative 'turtle'

room_name = "1000"
build_box = BuildBox.new(room_name)

build_box.set_box_size(0.3)
build_box.set_build_interval(0.01)
t = Turtle.new(build_box)

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

build_box.send_data()
