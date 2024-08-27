require 'voxelamming'
# require_relative 'voxelamming'

texture_names = ["grass", "stone", "dirt", "planks", "bricks"]
room_name = "1000"
vox = Voxelamming::VoxelammingManager.new(room_name)
# vox = VoxelammingManager.new(room_name)

vox.set_box_size(1)
vox.set_build_interval(0.01)

texture_names.each_with_index do |texture, i|
  vox.create_box(0, texture_names.length - i - 1, 0, texture: texture)
end

vox.send_data()
vox.clear_data()
sleep(0.1)

vox.set_box_size(1)
vox.set_build_interval(0.01)
vox.change_shape('sphere')
texture_names.each_with_index do |texture, i|
  vox.create_box(1, texture_names.length - i - 1, 0, texture: texture)
end

vox.send_data()
vox.clear_data()
sleep(0.1)

vox.set_box_size(1)
vox.set_build_interval(0.01)
vox.change_shape('plane')
texture_names.each_with_index do |texture, i|
  vox.create_box(2, texture_names.length - i - 1, 0, texture: texture)
end

vox.send_data()
vox.clear_data()
