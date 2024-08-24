# voxelammingパッケージからVoxelammingクラスをインポートします
from voxelamming_local import Voxelamming
import time

# Voxelammingアプリに表示されている部屋名を指定してください
room_name = "1000"
# Voxelammingクラスのインスタンスを生成します
voxelamming = Voxelamming(room_name)

# ボクセルのサイズを設定します
box_size = 10
voxelamming.set_box_size(box_size)
# ボクセルの配置間隔を設定します
voxelamming.set_build_interval(0.01)
# 座標軸を描きます
voxelamming.set_command('axis')

# ボクセルを配置するため、位置と色を設定します
voxelamming.change_shape('sphere')
voxelamming.create_box(0, 0, 0, 1, 0, 0, 1)
voxelamming.create_model('Skull', -2, 0, 0, 0, 0, 0, 1, 'skull_model_1')
voxelamming.create_model('Skull', 2, 0, 0, 0, 0, 0, 1, 'skull_model_2')
voxelamming.create_model('Skull', 0, 2, 0, 0, 0, 0, 1, 'skull_model_3')

# ボクセルデータをアプリに送信します。
voxelamming.send_data("Skulls")
# ボクセルデータを初期化
voxelamming.clear_data()

# モデルを移動を行います
for i in range(20):
    time.sleep(0.1)
    voxelamming.set_box_size(box_size)
    voxelamming.move_model('skull_model_1', -2, i * 0.2, 0, 0, 0, 0)
    voxelamming.move_model('skull_model_2', 2, 0, 0, 0, i * 10, 0)
    voxelamming.move_model('skull_model_3', 0, 2, 0, 0, 0, 0, i * 0.1 + 1)
    voxelamming.send_data()
