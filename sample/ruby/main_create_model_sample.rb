require_relative 'build_box'
# require 'voxelamming'

# Voxelammingアプリに表示されている部屋名を指定してください
room_name = "1000"
# BuildBoxクラスのインスタンスを生成します
build_box = BuildBox.new(room_name)
# build_box = Voxelamming::BuildBox.new(room_name)

# ボクセルのサイズを設定します
build_box.set_box_size(10)
# ボクセルの配置間隔を設定します
build_box.set_build_interval(0.01)
# 座標軸を表示します
build_box.set_command('axis')

# ボクセルを配置するため、位置と色を設定します
build_box.change_shape('sphere')
build_box.create_box(0, 0, 0, r: 1, g: 0, b: 0)
build_box.create_model('Earth', x: 0, y: 2, z: 0)
build_box.create_model('ToyCar', x: 0, y: 4, z: 0, pitch: 90, yaw: 0, roll: 0 , scale: 1)
build_box.create_model('ToyBiplane', x: 0, y: 6, z: 0, pitch: 0, yaw: 90, roll: 0 , scale: 1)
build_box.create_model('Robot', x: 0, y: 8, z: 0, pitch: 0, yaw: 0, roll: 90 , scale: 1)
build_box.create_model('Skull', x: 0, y: 10, z: 0, pitch: 0, yaw: 0, roll: 90 , scale: 1)
build_box.create_model('Skull', x: 0, y: 12, z: 0, pitch: 90, yaw: 0, roll: 0 , scale: 1)
build_box.create_model('Skull', x: 0, y: 14, z: 0, pitch: 90, yaw: 0, roll: 90 , scale: 1)

# ボクセルデータをアプリに送信します
build_box.send_data(name: "createModel")
