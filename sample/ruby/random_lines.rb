require 'voxelamming'

room_name = '1000'
build_box = Voxelamming::BuildBox.new(room_name)

build_box.set_box_size(0.3)
build_box.set_build_interval(0.01)
build_box.transform(0, 30, 0)

100.times do
  x = SecureRandom.random_number(-30..30)
  y = SecureRandom.random_number(-30..30)
  z = SecureRandom.random_number(-30..30)
  r = SecureRandom.rand
  g = SecureRandom.rand
  b = SecureRandom.rand
  build_box.draw_line(0, 0, 0, x, y, z, r: r, g: g, b: b, alpha: 1)
end

build_box.send_data()
