# voxelammingパッケージからBuildBoxクラスをインポートします
from voxelamming import BuildBox
# from build_box import BuildBox

# Voxelammingアプリに表示されている部屋名を指定してください
room_name = "1000"
# BuildBoxクラスのインスタンスを生成します
build_box = BuildBox(room_name)

# ボクセルのサイズを設定します
build_box.set_box_size(10)
# ボクセルの配置間隔を設定します
build_box.set_build_interval(0.01)
# 座標軸を描きます
build_box.set_command('axis')

# ボクセルを配置するため、位置と色を設定します
build_box.change_shape('sphere')
build_box.create_box(0, 0, 0, 1, 0, 0, 1)
build_box.create_model('Earth', 0, 2, 0)
build_box.create_model('ToyCar', 0, 4, 0, 90, 0, 0)
build_box.create_model('ToyBiplane', 0, 6, 0, 0, 90, 0)
build_box.create_model('Robot', 0, 8, 0, 0, 0, 90)
build_box.create_model('Skull', 0, 10, 0, 0, 0, 90)
build_box.create_model('Skull', 0, 12, 0, 90, 0, 0)
build_box.create_model('Skull', 0, 14, 0, 90, 0, 90)

# ボクセルデータをアプリに送信します。
build_box.send_data("createModel")
