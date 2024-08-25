# voxelammingパッケージからVoxelammingクラスをインポートします
from voxelamming import Voxelamming
# from voxelamming_local import Voxelamming  # ローカルで開発している場合はこちらを使う
import time

# Voxelammingアプリに表示されている部屋名を指定してください
room_name = "1000"
# Voxelammingクラスのインスタンスを生成します
vox = Voxelamming(room_name)

# ボクセルのサイズを設定します
box_size = 10
vox.set_box_size(box_size)
# ボクセルの配置間隔を設定します
vox.set_build_interval(0.01)
# 座標軸を描きます
vox.set_command('axis')

# ボクセルを配置するため、位置と色を設定します
vox.change_shape('sphere')
vox.create_box(0, 0, 0, 1, 0, 0, 1)
vox.create_model('Skull', -2, 0, 0, 0, 0, 0, 1, 'skull_model_1')
vox.create_model('Skull', 2, 0, 0, 0, 0, 0, 1, 'skull_model_2')
vox.create_model('Skull', 0, 2, 0, 0, 0, 0, 1, 'skull_model_3')

# ボクセルデータをアプリに送信します。
vox.send_data("Skulls")
# ボクセルデータを初期化
vox.clear_data()

# モデルを移動を行います
for i in range(20):
    time.sleep(0.1)
    vox.set_box_size(box_size)
    vox.move_model('skull_model_1', -2, i * 0.2, 0, 0, 0, 0)
    vox.move_model('skull_model_2', 2, 0, 0, 0, i * 10, 0)
    vox.move_model('skull_model_3', 0, 2, 0, 0, 0, 0, i * 0.1 + 1)
    vox.send_data()
