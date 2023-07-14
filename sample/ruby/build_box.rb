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

  def set_node(self, x, y, z, pitch=0, yaw=0, roll=0):
    x, y, z = [x, y, z].map(&:floor)
    @node = [x, y, z, pitch, yaw, roll]

  def animation_node(self, x, y, z, pitch=0, yaw=0, roll=0, scale=1, interval=10):
    x, y, z = [x, y, z].map(&:floor)
    @animation = [x, y, z, pitch, yaw, roll, scale, interval]

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

  def write_sentence(self, sentence, x, y, z, r=1, g=1, b=1, alpha=1):
    x, y, z = [x, y, z].map(&:floor).map(&:to_s)
    r, g, b, alpha =  [r, g, b, alpha].map(&:floor).map(&:to_s)
    self.sentence = [sentence, x, y, z, r, g, b, alpha]

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
