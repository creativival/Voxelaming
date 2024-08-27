require 'voxelamming'
# require_relative 'voxelamming'

room_name = "1000"
vox = Voxelamming::VoxelammingManager.new(room_name)
# vox = VoxelammingManager.new(room_name)

vox.set_command('axis')
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
  vox.create_box(0, i, 0, r: color[0], g: color[1], b: color[2])
end

vox.set_light(1, 1, 0, r: 1, g: 0, b: 0, alpha: 1, intensity: 20000, interval: 2, light_type: 'directional')
vox.set_light(0, 1, 1, r: 0, g: 1, b: 0, alpha: 1, intensity: 20000, interval: 3, light_type: 'spot')
vox.set_light(-1, 1, 0, r: 0, g: 1, b: 1, alpha: 1, intensity: 20000, interval: 5, light_type: 'point')

vox.send_data(name: 'light_sample')
