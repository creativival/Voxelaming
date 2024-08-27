require 'voxelamming'
# require_relative 'voxelamming'

room_name = "1000"
vox = Voxelamming::VoxelammingManager.new(room_name)
# vox = VoxelammingManager.new(room_name)

vox.set_box_size(1)
vox.set_build_interval(0.01)

colors = [
  [0, 0, 0],
  [1, 0, 0],
  [0, 1, 0],
  [0, 0, 1],
  [1, 1, 0],
  [1, 0, 1],
  [0, 1, 1],
  [1, 1, 1],
  [0.5, 0.5, 0.5],
  [0.5, 0, 0],
  [0, 0.5, 0],
  [0, 0, 0.5],
  [0.5, 0.5, 0],
  [0.5, 0, 0.5],
  [0, 0.5, 0.5],
]

colors.each_with_index do |color, i|
  vox.create_box(0, i, 0, r: color[0], g: color[1], b: color[2], alpha: 1)
end

(0..4).each do |i|
  vox.change_material(is_metallic: false, roughness: 0.25 * i)
  vox.transform(i, 0, 0, pitch: 0, yaw: 0, roll: 0)
  vox.send_data
  sleep(0.1)
end

(0..4).each do |i|
  vox.change_material(is_metallic: true, roughness: 0.25 * i)
  vox.transform(5 + i, 0, 0, pitch: 0, yaw: 0, roll: 0)
  vox.send_data
  sleep(0.1)
end
