def get_boxes_from_ply(ply_file)
  box_positions = Set.new
  File.open("../ply_file/#{ply_file}", 'r') do |f|
    lines = f.read
    lines = lines.gsub("\r\n", "\n")
    lines = lines.strip
    positions = lines.split("\n").select { |ln| is_included_six_numbers(ln) }.map { |ln| ln.split.map(&:to_f) }

    number_of_faces = positions.length / 4
    (0...number_of_faces).each do |i|
      vertex1 = positions[i * 4]
      vertex2 = positions[i * 4 + 1]
      vertex3 = positions[i * 4 + 2]
      vertex4 = positions[i * 4 + 3] # no need
      x = [vertex1[0], vertex2[0], vertex3[0]].min
      y = [vertex1[1], vertex2[1], vertex3[1]].min
      z = [vertex1[2], vertex2[2], vertex3[2]].min
      r = vertex1[3] / 255.0
      g = vertex1[4] / 255.0
      b = vertex1[5] / 255.0
      alpha = 1

      # ボックスを置く方向を解析
      if vertex1[0] == vertex2[0] && vertex2[0] == vertex3[0] # y-z plane
        step = [vertex1[1], vertex2[1], vertex3[1]].max - y
        x -= step if vertex1[1] != vertex2[1]
      elsif vertex1[1] == vertex2[1] && vertex2[1] == vertex3[1] # z-x plane
        step = [vertex1[2], vertex2[2], vertex3[2]].max - z
        y -= step if vertex1[2] != vertex2[2]
      else # x-y plane
        step = [vertex1[0], vertex2[0], vertex3[0]].max - x
        z -= step if vertex1[0] != vertex2[0]
      end

      # minimum unit: 0.1
      position_x = (x * 10.0 / step).round / 10.0
      position_y = (y * 10.0 / step).round / 10.0
      position_z = (z * 10.0 / step).round / 10.0
      box_positions.add([position_x, position_z, -position_y, r, g, b, alpha])
    end
  end

  box_positions
end

def is_included_six_numbers(line)
  line_list = line.split
  return false if line_list.length != 6

  line_list.all? { |num| Float(num) rescue false }
end
