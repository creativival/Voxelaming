require 'voxelamming'
# require_relative 'voxelamming'

room_name = "1000"
vox = Voxelamming::VoxelammingManager.new(room_name)
# vox = VoxelammingManager.new(room_name)

vox.set_box_size(0.3)
vox.set_build_interval(0.01)

(0..9).each do |i|
  vox.create_box(-1, i, 0, r: 0, g: 1, b: 1, alpha: 1)
  vox.create_box(0, i, 0, r: 1, g: 0, b: 0, alpha: 1)
  vox.create_box(1, i, 0, r: 1, g: 1, b: 0, alpha: 1)
  vox.create_box(2, i, 0, r: 0, g: 1, b: 1, alpha: 1)
end

(0..4).each do |i|
  vox.remove_box(0, i * 2 + 1, 0)
  vox.remove_box(1, i * 2, 0)
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
  vox.transform(x, y, z, pitch: 0, yaw: 0, roll: 0)
  vox.send_data()
  sleep(0.1)
end

vox.animate_global(0, 0, 0, pitch: 0, yaw: 180, roll: 0, scale: 1, interval: 100)
vox.send_data()
