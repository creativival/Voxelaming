# voxelammingパッケージからVoxelammingクラスをインポートします
from voxelamming_local import Voxelamming
# from voxelamming import Voxelamming

# Voxelammingアプリに表示されている部屋名を指定してください
room_name = "1000"
# Voxelammingクラスのインスタンスを生成します
voxelamming = Voxelamming(room_name)

# ボクセルのサイズを設定します
voxelamming.set_box_size(10)
# ボクセルの配置間隔を設定します
voxelamming.set_build_interval(0.01)
# 座標軸を描きます
voxelamming.set_command('axis')

# ボクセルを配置するため、位置と色を設定します
voxelamming.change_shape('sphere')
voxelamming.create_box(0, 0, 0, 1, 0, 0, 1)
voxelamming.create_model('Earth', 0, 2, 0)
voxelamming.create_model('ToyCar', 0, 4, 0, 90, 0, 0)
voxelamming.create_model('ToyBiplane', 0, 6, 0, 0, 90, 0)
voxelamming.create_model('Robot', 0, 8, 0, 0, 0, 90)
voxelamming.create_model('Skull', 0, 10, 0, 0, 0, 90)
voxelamming.create_model('Skull', 0, 12, 0, 90, 0, 0)
voxelamming.create_model('Skull', 0, 14, 0, 90, 0, 90)

# ボクセルデータをアプリに送信します。
voxelamming.send_data("createModel")
