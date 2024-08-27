require 'voxelamming'
# require_relative 'voxelamming'

def draw_three_branches(count, branch_length)
  count -= 1
  return if count < 0

  shorted_branch_length = branch_length * $length_ratio
  puts 'push_matrix'
  $vox.push_matrix()

  # first branch
  $vox.transform(0, branch_length, 0, pitch: $angle_to_open, yaw: 0, roll: 0)
  $vox.draw_line(0, 0, 0, 0, shorted_branch_length, 0, r: 1, g: 0, b: 1)
  draw_three_branches(count, shorted_branch_length)

  # second branch
  $vox.transform(0, branch_length, 0, pitch: $angle_to_open, yaw: 120, roll: 0)
  $vox.draw_line(0, 0, 0, 0, shorted_branch_length, 0, r: 1, g: 0, b: 0)
  draw_three_branches(count, shorted_branch_length)

  # third branch
  $vox.transform(0, branch_length, 0, pitch: $angle_to_open, yaw: 240, roll: 0)
  $vox.draw_line(0, 0, 0, 0, shorted_branch_length, 0, r: 1, g: 1, b: 0)
  draw_three_branches(count, shorted_branch_length)

  puts 'pop_matrix'
  $vox.pop_matrix()
end

room_name = "1000"
$vox = Voxelamming::VoxelammingManager.new(room_name)
# $vox = VoxelammingManager.new(room_name)
initial_length = 10
$repeat_count = 5
$angle_to_open = 30
$length_ratio = 0.8

$vox.change_shape('sphere')
$vox.set_command('float')
$vox.draw_line(0, 0, 0, 0, initial_length, 0, r: 0, g: 1, b: 1)

draw_three_branches($repeat_count, initial_length)
$vox.send_data(name: 'matrix_sample')
