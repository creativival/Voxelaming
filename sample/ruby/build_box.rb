require 'json'
require 'faye/websocket'
require 'eventmachine'
require 'date'
require_relative 'matrix_util'

class BuildBox
  @@texture_names = ["grass", "stone", "dirt", "planks", "bricks"]

  def initialize(room_name)
    @room_name = room_name
    @is_allowed_matrix = 0
    @saved_matrices = []
    @translation = [0, 0, 0, 0, 0, 0]
    @matrix_translation = [0, 0, 0, 0, 0, 0]
    @frame_translations = []
    @global_animation = [0, 0, 0, 0, 0, 0, 1, 0]
    @animation = [0, 0, 0, 0, 0, 0, 1, 0]
    @boxes = []
    @frames = []
    @sentence = []
    @lights = []
    @commands = []
    @size = 1
    @shape = 'box'
    @is_metallic = 0
    @roughness = 0.5
    @is_allowed_float = 0
    @build_interval = 0.01
    @is_framing = false
    @frame_id = 0
  end

  def clear_data
    @translation = [0, 0, 0, 0, 0, 0]
    @is_allowed_matrix = 0
    @saved_matrices = []
    @translation = [0, 0, 0, 0, 0, 0]
    @matrix_translation = [0, 0, 0, 0, 0, 0]
    @frame_translations = []
    @global_animation = [0, 0, 0, 0, 0, 0, 1, 0]
    @animation = [0, 0, 0, 0, 0, 0, 1, 0]
    @boxes = []
    @frames = []
    @sentence = []
    @lights = []
    @commands = []
    @size = 1
    @shape = 'box'
    @is_metallic = 0
    @roughness = 0.5
    @is_allowed_float = 0
    @build_interval = 0.01
    @is_framing = false
    @frame_id = 0
  end

  def set_frame_fps(fps = 2)
    @commands << "fps #{fps}"
  end

  def set_frame_repeats(repeats = 10)
    @commands << "repeats #{repeats}"
  end

  def frame_in
    @is_framing = true
  end

  def frame_out
    @is_framing = false
    @frame_id += 1
  end

  def push_matrix
    @is_allowed_matrix += 1
    @saved_matrices.push(@matrix_translation)
  end

  def pop_matrix
    @is_allowed_matrix -= 1
    @matrix_translation = @saved_matrices.pop
  end

  def translate(x, y, z, pitch: 0, yaw: 0, roll: 0)
    if @is_allowed_matrix > 0
      # 移動用のマトリックスを計算する
      matrix = @saved_matrices.last
      puts "before matrix: #{matrix}"
      base_position = matrix[0..2]

      if matrix.length == 6
        base_rotation_matrix = get_rotation_matrix(matrix[3], matrix[4], matrix[5])
      else
        base_rotation_matrix = [matrix[3..5], matrix[6..8], matrix[9..11]]
      end

      # Compute the new position after translation
      add_x, add_y, add_z = transform_point_by_rotation_matrix([x, y, z], transpose_3x3(base_rotation_matrix))
      x, y, z = add_vectors(base_position, [add_x, add_y, add_z])
      x, y, z = round_numbers([x, y, z])

      # Compute the rotation after translation
      translate_rotation_matrix = get_rotation_matrix(-pitch, -yaw, -roll)
      rotate_matrix = matrix_multiply(translate_rotation_matrix, base_rotation_matrix)
      @matrix_translation = [x, y, z, *rotate_matrix[0], *rotate_matrix[1], *rotate_matrix[2]]
    else
      x, y, z = round_numbers([x, y, z])

      if @is_framing
        @frame_translations.append([x, y, z, pitch, yaw, roll, @frame_id])
      else
        @translation = [x, y, z, pitch, yaw, roll]
      end
    end
  end

  def create_box(x, y, z, r: 1, g: 1, b: 1, alpha: 1, texture: '')
    if @is_allowed_matrix > 0
      # 移動用のマトリックスにより位置を計算する
      matrix = @matrix_translation
      base_position = matrix[0..2]

      if matrix.length == 6
        base_rotation_matrix = get_rotation_matrix(matrix[3], matrix[4], matrix[5])
      else
        base_rotation_matrix = [matrix[3..5], matrix[6..8], matrix[9..11]]
      end

      # Compute the new position after translation
      add_x, add_y, add_z = transform_point_by_rotation_matrix([x, y, z], transpose_3x3(base_rotation_matrix))
      x, y, z = add_vectors(base_position, [add_x, add_y, add_z])
    end

    x, y, z = round_numbers([x, y, z])
    r, g, b, alpha = round_colors([r, g, b, alpha])

    # 重ねておくことを防止
    remove_box(x, y, z)
    if !@@texture_names.include?(texture)
      texture_id = -1
    else
      texture_id = @@texture_names.index(texture)
    end

    if @is_framing
      @frames.append([x, y, z, r, g, b, alpha, texture_id, @frame_id])
    else
      @boxes.append([x, y, z, r, g, b, alpha, texture_id])
    end
  end

  def remove_box(x, y, z)
    x, y, z = round_numbers([x, y, z])

    if @is_framing
      @frames.reject! { |frame| frame[0] == x && frame[1] == y && frame[2] == z && frame[8] == @frame_id }
    else
      @boxes.reject! { |box| box[0] == x && box[1] == y && box[2] == z }
    end
  end

  def animate_global(x, y, z, pitch: 0, yaw: 0, roll: 0, scale: 1, interval: 10)
    x, y, z = round_numbers([x, y, z])
    @global_animation = [x, y, z, pitch, yaw, roll, scale, interval]
  end

  def animate(x, y, z, pitch: 0, yaw: 0, roll: 0, scale: 1, interval: 10)
    x, y, z = round_numbers([x, y, z])
    @animation = [x, y, z, pitch, yaw, roll, scale, interval]
  end

  def set_box_size(box_size)
    @size = box_size
  end

  def set_build_interval(interval)
    @build_interval = interval
  end

  def write_sentence(sentence, x, y, z, r: 1, g: 1, b: 1, alpha: 1)
    x, y, z = round_numbers([x, y, z]).map(&:to_s)
    r, g, b, alpha = round_colors([r, g, b, alpha])
    r, g, b, alpha =  [r, g, b, alpha].map(&:floor).map(&:to_s)
    @sentence = [sentence, x, y, z, r, g, b, alpha]
  end

  def set_light(x, y, z, r: 1, g: 1, b: 1, alpha: 1, intensity: 1000, interval: 1, light_type: 'point')
    x, y, z = round_numbers([x, y, z])
    r, g, b, alpha = round_colors([r, g, b, alpha])

    if light_type == 'point'
      light_type = 1
    elsif light_type == 'spot'
      light_type = 2
    elsif light_type == 'directional'
      light_type = 3
    else
      light_type = 1
    end
    @lights << [x, y, z, r, g, b, alpha, intensity, interval, light_type]
  end

  def set_command(command)
    @commands << command

    if command == 'float'
      @is_allowed_float = 1
    end
  end

  def draw_line(x1, y1, z1, x2, y2, z2, r: 1, g: 1, b: 1, alpha: 1)
    x1, y1, z1, x2, y2, z2 = [x1, y1, z1, x2, y2, z2].map(&:floor)
    diff_x = x2 - x1
    diff_y = y2 - y1
    diff_z = z2 - z1
    max_length = [diff_x.abs, diff_y.abs, diff_z.abs].max

    return false if diff_x == 0 && diff_y == 0 && diff_z == 0

    if diff_x.abs == max_length
      if x2 > x1
        (x1..x2).each do |x|
          y = y1 + (x - x1) * diff_y.to_f / diff_x
          z = z1 + (x - x1) * diff_z.to_f / diff_x
          create_box(x, y, z, r: r, g: g, b: b, alpha: alpha)
        end
      else
        x1.downto(x2 + 1) do |x|
          y = y1 + (x - x1) * diff_y.to_f / diff_x
          z = z1 + (x - x1) * diff_z.to_f / diff_x
          create_box(x, y, z, r: r, g: g, b: b, alpha: alpha)
        end
      end
    elsif diff_y.abs == max_length
      if y2 > y1
        (y1..y2).each do |y|
          x = x1 + (y - y1) * diff_x.to_f / diff_y
          z = z1 + (y - y1) * diff_z.to_f / diff_y
          create_box(x, y, z, r: r, g: g, b: b, alpha: alpha)
        end
      else
        y1.downto(y2 + 1) do |y|
          x = x1 + (y - y1) * diff_x.to_f / diff_y
          z = z1 + (y - y1) * diff_z.to_f / diff_y
          create_box(x, y, z, r: r, g: g, b: b, alpha: alpha)
        end
      end
    elsif diff_z.abs == max_length
      if z2 > z1
        (z1..z2).each do |z|
          x = x1 + (z - z1) * diff_x.to_f / diff_z
          y = y1 + (z - z1) * diff_y.to_f / diff_z
          create_box(x, y, z, r: r, g: g, b: b, alpha: alpha)
        end
      else
        z1.downto(z2 + 1) do |z|
          x = x1 + (z - z1) * diff_x.to_f / diff_z
          y = y1 + (z - z1) * diff_y.to_f / diff_z
          create_box(x, y, z, r: r, g: g, b: b, alpha: alpha)
        end
      end
    end
  end

  def change_shape(shape)
    @shape = shape
  end

  def change_material(is_metallic: false, roughness: 0.5)
    @is_metallic = is_metallic ? 1 : 0
    @roughness = roughness
  end

  def send_data
    puts 'send_data'
    now = DateTime.now
    data_to_send = {
      "translation": @translation,
      "frameTranslations": @frame_translations,
      "globalAnimation": @global_animation,
      "animation": @animation,
      "boxes": @boxes,
      "frames": @frames,
      "sentence": @sentence,
      "lights": @lights,
      "commands": @commands,
      "size": @size,
      "shape": @shape,
      "interval": @build_interval,
      "isMetallic": @is_metallic,
      "roughness": @roughness,
      "isAllowedFloat": @is_allowed_float,
      "date": now.to_s
    }.to_json

    EM.run do
      ws = Faye::WebSocket::Client.new('wss://websocket.voxelamming.com')

      ws.on :open do |_event|
        p [:open]
        puts 'WebSocket connection open'
        ws.send(@room_name)
        puts "Joined room: #{@room_name}"
        ws.send(data_to_send)
        puts data_to_send
        puts 'Sent data to server'

        EM.add_timer(1) do
          ws.close
          EM.stop
        end
      end

      ws.on :error do |event|
        puts "WebSocket error: #{event.message}"
        EM.stop
      end

      ws.on :close do |_event|
        puts 'WebSocket connection closed'
        EM.stop
      end
    end
  end

  def round_numbers(num_list)
    if @is_allowed_float == 1
      num_list.map { |val| val.round(2) }
    else
      num_list.map { |val| val.round(1).floor }
    end
  end

  def round_colors(num_list)
    num_list.map { |val| val.round(2) }
  end
end
