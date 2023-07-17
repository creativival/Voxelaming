require 'csv'

$column_num, $row_num = 257, 257

def get_map_data_from_csv(csv_file, height_scale)
  # csvファイルから地図データを読み込み
  heights = []

  CSV.foreach("../map_file/#{csv_file}") do |row|
    for h in row
      h = h.to_f
      h = h != 0 ? (h * height_scale).floor : -1
      heights << h
    end
  end
#   puts "heights: #{heights}"

  max_height = heights.max.floor
  box_positions = (0...$row_num).map { |i| heights[i * $column_num, $column_num] }
  puts "max_height: #{max_height}"
#   puts "box_positions: #{box_positions}"
  { 'boxes' => box_positions, 'max_height' => max_height }
end

def get_box_color(height, max_height, high_color, low_color)
  # 高さによって色を変える
  r = (high_color[0] - low_color[0]) * height * 1.0 / max_height + low_color[0]
  g = (high_color[1] - low_color[1]) * height * 1.0 / max_height + low_color[1]
  b = (high_color[2] - low_color[2]) * height * 1.0 / max_height + low_color[2]

  [r, g, b]
end
