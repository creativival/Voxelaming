import time
# voxelammingパッケージからBuildBoxクラスをインポートします
from voxelamming import BuildBox

# Voxelammingアプリに表示されている部屋名を指定してください
room_name = "1000"
# BuildBoxクラスのインスタンスを生成します
build_box = BuildBox(room_name)
# ボクセルの設定を行います
build_box.set_box_size(0.5)
build_box.set_build_interval(0.01)

# ボクセルを配置するため、位置と色を設定します
build_box.translate(0, 16, 0, pitch=0, yaw=0, roll=0)
build_box.write_sentence("Hello World", 0, 0, 0, r=1, g=0, b=0, alpha=1)
# ボクセルデータをアプリに送信します。
build_box.send_data("Hello World")

time.sleep(1)

# ボクセルを配置するため、位置と色を設定します
build_box.translate(0, 0, 0, pitch=0, yaw=0, roll=0)
build_box.write_sentence("こんにちは", 0, 0, 0, r=0, g=1, b=0, alpha=1)
# ボクセルデータをアプリに送信します。
build_box.send_data("こんにちは")
