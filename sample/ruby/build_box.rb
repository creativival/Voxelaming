require 'json'
require 'faye/websocket'
require 'eventmachine'
require 'date'

class BuildBox
  def initialize(room_name)
    @room_name = room_name
    @node = [0, 0, 0, 0, 0, 0]
    @animation = [0, 0, 0, 0, 0, 0, 1, 0]
    @boxes = []
    @sentence = []
    @size = 1
    @build_interval = 0.01
  end

  def set_node(x, y, z, pitch=0, yaw=0, roll=0)
    x, y, z = [x, y, z].map(&:floor)
    @node = [x, y, z, pitch, yaw, roll]
  end

  def animation_node(x, y, z, pitch=0, yaw=0, roll=0, scale=1, interval=10)
    x, y, z = [x, y, z].map(&:floor)
    @animation = [x, y, z, pitch, yaw, roll, scale, interval]
  end

  def create_box(x, y, z, r = 1, g = 1, b = 1, alpha = 1)
    x, y, z = [x, y, z].map(&:floor)
    @boxes << [x, y, z, r, g, b, alpha]
  end

  def remove_box(x, y, z)
    x, y, z = [x, y, z].map(&:floor)
    @boxes.reject! { |box| box[0] == x && box[1] == y && box[2] == z }
  end

  def set_box_size(box_size)
    @size = box_size
  end

  def set_build_interval(interval)
    @build_interval = interval
  end

  def clear_data
    @node = [0, 0, 0, 0, 0, 0]
    @animation = [0, 0, 0, 0, 0, 0, 1, 0]
    @boxes = []
    @sentence = []
    @size = 1
    @build_interval = 0.01
  end

  def write_sentence(sentence, x, y, z, r=1, g=1, b=1, alpha=1)
    x, y, z = [x, y, z].map(&:floor).map(&:to_s)
    r, g, b, alpha =  [r, g, b, alpha].map(&:floor).map(&:to_s)
    @sentence = [sentence, x, y, z, r, g, b, alpha]
  end

  def draw_line(x1, y1, z1, x2, y2, z2, r = 1, g = 1, b = 1, alpha = 1)
    x1 = x1.floor
    y1 = y1.floor
    z1 = z1.floor
    x2 = x2.floor
    y2 = y2.floor
    z2 = z2.floor
    diff_x = x2 - x1
    diff_y = y2 - y1
    diff_z = z2 - z1

    return false if diff_x.zero? && diff_y.zero? && diff_z.zero?

    if diff_x == [diff_x, diff_y, diff_z].max
      (x1..x2).each do |x|
        y = y1 + (x - x1) * diff_y.to_f / diff_x
        z = z1 + (x - x1) * diff_z.to_f / diff_x
        create_box(x, y, z, r, g, b, alpha)
      end
    elsif diff_y == [diff_x, diff_y, diff_z].max
      (y1..y2).each do |y|
        x = x1 + (y - y1) * diff_x.to_f / diff_y
        z = z1 + (y - y1) * diff_z.to_f / diff_y
        create_box(x, y, z, r, g, b, alpha)
      end
    elsif diff_z == [diff_x, diff_y, diff_z].max
      (z1..z2).each do |z|
        x = x1 + (z - z1) * diff_x.to_f / diff_z
        y = y1 + (z - z1) * diff_y.to_f / diff_z
        create_box(x, y, z, r, g, b, alpha)
      end
    end
  end


  def send_data
    puts 'send_data'
    now = DateTime.now
    data_to_send = {
      "node": @node,
      "animation": @animation,
      "boxes": @boxes,
      "sentence": @sentence,
      "size": @size,
      "interval": @build_interval,
      "date": now.to_s
    }.to_json

    EM.run do
      ws = Faye::WebSocket::Client.new('wss://render-nodejs-server.onrender.com')

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
end
