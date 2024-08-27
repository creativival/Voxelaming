require 'voxelamming'
# require_relative 'voxelamming'

# Voxelammingアプリに表示されている部屋名を指定してください
room_name = "1000"
# BuildBoxクラスのインスタンスを生成します
vox = Voxelamming::VoxelammingManager.new(room_name)
# vox = VoxelammingManager.new(room_name)

# ボクセルのサイズを設定します
box_size = 10
vox.set_box_size(box_size)
# ボクセルの配置間隔を設定します
vox.set_build_interval(0.01)
# 座標軸を表示します
vox.set_command('axis')

# ボクセルを配置するため、位置と色を設定します
vox.change_shape('sphere')
vox.create_box(0, 0, 0, r: 1, g: 0, b: 0)
vox.create_model('Skull', x: -2, y: 0, z: 0, pitch: 0, yaw: 0, roll: 0 , scale: 1, entity_name: 'skull_model_1')
vox.create_model('Skull', x: 2, y: 0, z: 0, pitch: 0, yaw: 0, roll: 0 , scale: 1, entity_name: 'skull_model_2')
vox.create_model('Skull', x: 0, y: 2, z: 0, pitch: 0, yaw: 0, roll: 0 , scale: 1, entity_name: 'skull_model_3')

# ボクセルデータをアプリに送信します
vox.send_data(name: "Skulls")
# ボクセルデータを初期化
vox.clear_data()

# モデルを移動を行います
20.times do |i|
  sleep(0.1)
  vox.set_box_size(box_size)
  vox.move_model('skull_model_1', x: -2, y: i * 0.2, z: 0, pitch: 0, yaw: 0, roll: 0, scale: 1)
  vox.move_model('skull_model_2', x: 2, y: 0, z: 0, pitch: 0, yaw: i * 10, roll: 0 , scale: 1)
  vox.move_model('skull_model_3', x: 0, y: 2, z: 0, pitch: 0, yaw: 0, roll: 0, scale: i * 0.1 + 1)
  vox.send_data
end
