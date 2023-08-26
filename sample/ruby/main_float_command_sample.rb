require_relative 'build_box'

room_name = "1000"
size = 1.0
radius = 1.5
repeat_count = 100

build_box = BuildBox.new(room_name)
build_box.set_build_interval(0.01)
build_box.set_box_size(size)
build_box.change_shape("sphere")
build_box.set_command('float')

(0...repeat_count).each do |i|
  angle = Math::PI * i * 720.0 / repeat_count / 180.0  # radians変換
  x = radius * Math.cos(angle)
  y = i
  z = radius * Math.sin(angle)

  build_box.create_box(x, y, z, r=0, g=1, b=1, alpha=1)
  build_box.create_box(-x, y, -z, r=0, g=1, b=1, alpha=1)
  if i.even?
    build_box.create_box(x / 3, y, z / 3, r=1, g=0, b=0, alpha=1)
  else
    build_box.create_box(-x / 3, y, -z / 3, r=1, g=1, b=0, alpha=1)
  end
end

build_box.send_data()

