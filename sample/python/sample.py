# voxelammingパッケージからBuildBoxクラスをインポートします
from voxelamming import BuildBox

# Voxelammingアプリに表示されている部屋名を指定してください
room_name = "1000"
# BuildBoxクラスのインスタンスを生成します
build_box = BuildBox(room_name)

# ボクセルを配置するため、位置と色を設定します
for i in range(20):
    build_box.create_box(0, i, 0)

# ボクセルデータをアプリに送信します。
build_box.send_data("sample")
