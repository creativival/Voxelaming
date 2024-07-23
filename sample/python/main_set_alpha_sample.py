# voxelammingパッケージからBuildBoxクラスをインポートします
from voxelamming import BuildBox

# Voxelammingアプリに表示されている部屋名を指定してください
room_name = "1000"
# BuildBoxクラスのインスタンスを生成します
build_box = BuildBox(room_name)

# ボクセルの設定を行います
build_box.set_box_size(0.3)
build_box.set_build_interval(0.01)
build_box.translate(0, 0, 0, pitch=0, yaw=0, roll=0)
build_box.animate(0, 0, 10, pitch=0, yaw=30, roll=0, scale=2, interval=0)

# ボクセルを配置するため、位置と色を設定します
for i in range(100):
    alpha = (100 - i) / 100
    build_box.create_box(-1, i, 0, r=0, g=1, b=1, alpha=alpha)
    build_box.create_box(0, i, 0, r=1, g=0, b=0, alpha=alpha)
    build_box.create_box(1, i, 0, r=1, g=1, b=0, alpha=alpha)
    build_box.create_box(2, i, 0, r=0, g=1, b=1, alpha=alpha)

for i in range(50):
    build_box.remove_box(0, i * 2 + 1, 0)
    build_box.remove_box(1, i * 2, 0)

# ボクセルデータをアプリに送信します。
build_box.send_data("main_set_alpha_sample")
