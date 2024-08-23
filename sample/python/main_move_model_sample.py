# voxelammingパッケージからBuildBoxクラスをインポートします
from voxelamming import BuildBox06
import time

# Voxelammingアプリに表示されている部屋名を指定してください
room_name = "1000"
# BuildBoxクラスのインスタンスを生成します
build_box = BuildBox(room_name)

# ボクセルのサイズを設定します
box_size = 10
build_box.set_box_size(box_size)
# ボクセルの配置間隔を設定します
build_box.set_build_interval(0.01)
# 座標軸を描きます
build_box.set_command('axis')

# ボクセルを配置するため、位置と色を設定します
build_box.change_shape('sphere')
build_box.create_box(0, 0, 0, 1, 0, 0, 1)
build_box.create_model('Skull', -2, 0, 0, 0, 0, 0, 1, 'skull_model_1')
build_box.create_model('Skull', 2, 0, 0, 0, 0, 0, 1, 'skull_model_2')
build_box.create_model('Skull', 0, 2, 0, 0, 0, 0, 1, 'skull_model_3')

# ボクセルデータをアプリに送信します。
build_box.send_data("Skulls")
# ボクセルデータを初期化
build_box.clear_data()

# モデルを移動を行います
for i in range(20):
    time.sleep(1)
    build_box.set_box_size(box_size)
    build_box.move_model('skull_model_1', -2, i * 0.2, 0, 0, 0, 0)
    build_box.move_model('skull_model_2', 2, 0, 0, 0, i * 10, 0)
    build_box.move_model('skull_model_3', 0, 2, 0, 0, 0, 0, i * 0.1 + 1)
    build_box.send_data()
