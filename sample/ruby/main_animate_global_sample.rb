require_relative 'build_box'

room_name = "1000"
build_box = BuildBox.new(room_name)

build_box.set_box_size(0.3)
build_box.set_build_interval(0.01)

(0..9).each do |i|
  build_box.create_box(-1, i, 0, r=0, g=1, b=1, alpha=1)
  build_box.create_box(0, i, 0, r=1, g=0, b=0, alpha=1)
  build_box.create_box(1, i, 0, r=1, g=1, b=0, alpha=1)
  build_box.create_box(2, i, 0, r=0, g=1, b=1, alpha=1)
end

(0..4).each do |i|
  build_box.remove_box(0, i * 2 + 1, 0)
  build_box.remove_box(1, i * 2, 0)
end

node_positions = [
  [0, 0, 0],
  [-10, 0, 0],
  [10, 0, 0],
  [0, -20, 0],
  [0, 20, 0],
  [0, 0, -10],
  [0, 0, 10]
]

node_positions.each do |x, y, z|
  build_box.translate(x, y, z, pitch=0, yaw=0, roll=0)
  build_box.send_data()
  sleep(1)
end

build_box.animate_global(0, 0, 0, pitch=0, yaw=180, roll=0, scale=1, interval=100)
build_box.send_data()