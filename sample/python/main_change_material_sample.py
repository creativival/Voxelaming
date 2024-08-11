from time import sleep
# voxelammingパッケージからBuildBoxクラスをインポートします
from voxelamming import BuildBox

# Voxelammingアプリに表示されている部屋名を指定してください
room_name = "1000"
# BuildBoxクラスのインスタンスを生成します
build_box = BuildBox(room_name)
# ボクセルの設定を行います
build_box.set_box_size(1)
build_box.set_build_interval(0.01)

# ボクセルを配置するため、位置と色を設定します
colors = [
    [0, 0, 0],
    [1, 0, 0],
    [0, 1, 0],
    [0, 0, 1],
    [1, 1, 0],
    [1, 0, 1],
    [0, 1, 1],
    [1, 1, 1],
    [0.5, 0.5, 0.5],
    [0.5, 0, 0],
    [0, 0.5, 0],
    [0, 0, 0.5],
    [0.5, 0.5, 0],
    [0.5, 0, 0.5],
]

for i, color in enumerate(colors):
    build_box.create_box(0, i, 0, *color, alpha=1)

for i in range(5):
    build_box.change_material(is_metallic=False, roughness=0.25 * i)
    build_box.transform(i, 0, 0, pitch=0, yaw=0, roll=0)
    # ボクセルデータをアプリに送信します。
    build_box.send_data()
    sleep(1)

for i in range(5):
    build_box.change_material(is_metallic=True, roughness=0.25 * i)
    build_box.transform(5 + i, 0, 0, pitch=0, yaw=0, roll=0)
    # ボクセルデータをアプリに送信します。
    build_box.send_data()
    sleep(1)
