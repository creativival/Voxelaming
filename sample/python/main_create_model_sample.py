# voxelammingパッケージからVoxelammingクラスをインポートします
from voxelamming_local import Voxelamming
# from voxelamming import Voxelamming

# Voxelammingアプリに表示されている部屋名を指定してください
room_name = "1000"
# Voxelammingクラスのインスタンスを生成します
vox = Voxelamming(room_name)

# ボクセルのサイズを設定します
vox.set_box_size(10)
# ボクセルの配置間隔を設定します
vox.set_build_interval(0.01)
# 座標軸を描きます
vox.set_command('axis')

# ボクセルを配置するため、位置と色を設定します
vox.change_shape('sphere')
vox.create_box(0, 0, 0, 1, 0, 0, 1)
vox.create_model('Earth', 0, 2, 0)
vox.create_model('ToyCar', 0, 4, 0, 90, 0, 0)
vox.create_model('ToyBiplane', 0, 6, 0, 0, 90, 0)
vox.create_model('Robot', 0, 8, 0, 0, 0, 90)
vox.create_model('Skull', 0, 10, 0, 0, 0, 90)
vox.create_model('Skull', 0, 12, 0, 90, 0, 0)
vox.create_model('Skull', 0, 14, 0, 90, 0, 90)

# ボクセルデータをアプリに送信します。
vox.send_data("createModel")
