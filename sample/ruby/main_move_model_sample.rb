require_relative 'build_box'
# require 'voxelamming'

# Voxelammingアプリに表示されている部屋名を指定してください
room_name = "1000"
# BuildBoxクラスのインスタンスを生成します
build_box = BuildBox.new(room_name)
# build_box = Voxelamming::BuildBox.new(room_name)

# ボクセルのサイズを設定します
box_size = 10
build_box.set_box_size(box_size)
# ボクセルの配置間隔を設定します
build_box.set_build_interval(0.01)
# 座標軸を表示します
build_box.set_command('axis')

# ボクセルを配置するため、位置と色を設定します
build_box.change_shape('sphere')
build_box.create_box(0, 0, 0, r: 1, g: 0, b: 0)
build_box.create_model('Skull', x: -2, y: 0, z: 0, pitch: 0, yaw: 0, roll: 0 , scale: 1, entity_name: 'skull_model_1')
build_box.create_model('Skull', x: 2, y: 0, z: 0, pitch: 0, yaw: 0, roll: 0 , scale: 1, entity_name: 'skull_model_2')
build_box.create_model('Skull', x: 0, y: 2, z: 0, pitch: 0, yaw: 0, roll: 0 , scale: 1, entity_name: 'skull_model_3')

# ボクセルデータをアプリに送信します
build_box.send_data(name: "Skulls")
# ボクセルデータを初期化
build_box.clear_data()

# モデルを移動を行います
20.times do |i|
  sleep(1)
  build_box.set_box_size(box_size)
  build_box.move_model('skull_model_1', x: -2, y: i * 0.2, z: 0, pitch: 0, yaw: 0, roll: 0, scale: 1)
  build_box.move_model('skull_model_2', x: 2, y: 0, z: 0, pitch: 0, yaw: i * 10, roll: 0 , scale: 1)
  build_box.move_model('skull_model_3', x: 0, y: 2, z: 0, pitch: 0, yaw: 0, roll: 0, scale: i * 0.1 + 1)
  build_box.send_data
end
