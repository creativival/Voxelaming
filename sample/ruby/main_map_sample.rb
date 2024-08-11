require 'voxelamming'
require_relative 'map_util'

room_name = "1000"
build_box = Voxelamming::BuildBox.new(room_name)

build_box.set_box_size(0.1)
build_box.set_build_interval(0.001)
build_box.set_command('liteRender')

column_num, row_num = 257, 257
csv_file = '../map_file/map_38_138_100km.csv'
height_scale = 100
high_color = [0.5, 0, 0]
low_color = [0, 1, 0]
map_data = Voxelamming.get_map_data_from_csv(csv_file, height_scale)
boxes = map_data['boxes']
max_height = map_data['max_height']
# skip = 1  # high power device
skip = 2  # normal device
# skip = 4  # low power device

(row_num / skip).times do |j|
  (column_num / skip).times do |i|
#     puts "#{i} #{j}"
    x = i - column_num / (skip * 2).floor
    z = j - row_num / (skip * 2).floor
    y = boxes[j * skip][i * skip]

    if y >= 0
      r, g, b = Voxelamming.get_box_color(y, max_height, high_color, low_color)
#       print("r: #{r}, g: #{g}, b: #{b}\n")
      build_box.create_box(x, y, z, r: r, g: g, b: b)
    end
  end
end

build_box.send_data()
