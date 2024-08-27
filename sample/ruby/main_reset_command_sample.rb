require 'voxelamming'
# require_relative 'voxelamming'
require_relative 'ply_util'

room_name = "1000"
vox = Voxelamming::VoxelammingManager.new(room_name)
# vox = VoxelammingManager.new(room_name)

animation_settings = [
    {
        model: 'frog1.ply',
        position: [0, 0, 0, 0, 0, 0],
    },
    {
        model: 'frog2.ply',
        position: [0, 0, 0, 0, 0, 0],
    },
    {
        model: 'frog3.ply',
        position: [0, 0, 0, 0, 0, 0],
    },
    {
        model: 'frog4.ply',
        position: [0, 5, 0, 0, 0, 0],
    },
    {
        model: 'frog5.ply',
        position: [0, 10, 0, 0, 0, 0],
    },
    {
        model: 'frog4.ply',
        position: [0, 5, 0, 0, 0, 0],
    },
    {
        model: 'frog3.ply',
        position: [0, 0, 0, 0, 0, 0],
    },
    {
        model: 'frog2.ply',
        position: [0, 0, 0, 0, 0, 0],
    },
]

3.times do
  animation_settings.each do |setting|
    model = setting[:model]
    position = setting[:position]

    boxes = get_boxes_from_ply(model)
    boxes.each do |b|
      vox.create_box(b[0], b[1], b[2], r: b[3], g: b[4], b: b[5])
    end

    vox.set_box_size(0.5)
    vox.set_build_interval(0)
    vox.transform(*position)
    vox.send_data
    sleep(0.1)

    vox.clear_data
    vox.set_command('reset')
    vox.send_data
    vox.clear_data
    sleep(0.1)
  end
end
