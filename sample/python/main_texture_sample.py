from time import sleep
# voxelammingパッケージからBuildBoxクラスをインポートします
from voxelamming import BuildBox

texture_names = ["grass", "stone", "dirt", "planks", "bricks"]
# Voxelammingアプリに表示されている部屋名を指定してください
room_name = "1000"
# BuildBoxクラスのインスタンスを生成します
build_box = BuildBox(room_name)

# ボクセルの設定を行います
build_box.set_box_size(1)
build_box.set_build_interval(0.01)

# ボクセルを配置するため、位置と色を設定します
for i, texture in enumerate(texture_names):
    build_box.create_box(0, len(texture_names) - i - 1, 0, texture=texture)

# ボクセルデータをアプリに送信します。
build_box.send_data()
# ボクセルデータをクリアします。
build_box.clear_data()
sleep(1)

# ボクセルの設定を行います
build_box.set_box_size(1)
build_box.set_build_interval(0.01)
build_box.change_shape('sphere')

# ボクセルを配置するため、位置と色を設定します
for i, texture in enumerate(texture_names):
    build_box.create_box(1, len(texture_names) - i - 1, 0, texture=texture)

# ボクセルデータをアプリに送信します。
build_box.send_data()
# ボクセルデータをクリアします。
build_box.clear_data()
sleep(1)

# ボクセルの設定を行います
build_box.set_box_size(1)
build_box.set_build_interval(0.01)
build_box.change_shape('plane')

# ボクセルを配置するため、位置と色を設定します
for i, texture in enumerate(texture_names):
    build_box.create_box(2, len(texture_names) - i - 1, 0, texture=texture)

# ボクセルデータをアプリに送信します。
build_box.send_data()
