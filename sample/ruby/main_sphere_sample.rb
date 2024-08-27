require 'voxelamming'
# require_relative 'voxelamming'

room_name = '1000'
vox = Voxelamming::VoxelammingManager.new(room_name)
# vox = VoxelammingManager.new(room_name)

vox.set_box_size(0.5)
vox.set_build_interval(0.01)

radius = 11

vox.set_box_size(0.5)
vox.set_build_interval(0.01)
vox.transform(0, radius, 0, pitch: 0, yaw: 0, roll: 0)

for i in -radius...radius + 1
  for j in -radius...radius + 1
    for k in -radius...radius + 1
      if ((radius -1 ) ** 2 <= i ** 2 + j ** 2 + k ** 2) and (i ** 2 + j ** 2 + k ** 2 < radius ** 2)
        puts i, j, k
        vox.create_box(i, j, k, r: 0, g: 1, b: 1)
      end
    end
  end
end

vox.send_data(name: 'make_sphere')
