# voxelammingパッケージからVoxelammingクラスをインポートします
# from voxelamming import Voxelamming
from voxelamming_local import Voxelamming

# Voxelammingアプリに表示されている部屋名を指定してください
room_name = "1000"
# Voxelammingクラスのインスタンスを生成します
voxelamming = Voxelamming(room_name)

# ボクセルのサイズを設定します
voxelamming.set_box_size(1)
# ボクセルの配置間隔を設定します
voxelamming.set_build_interval(0.01)

# ボクセルを配置するため、位置と色を設定します
for i in range(100):
    voxelamming.create_box(-1, i, 0, r=0, g=1, b=1, alpha=1)
    voxelamming.create_box(0, i, 0, r=1, g=0, b=0, alpha=1)
    voxelamming.create_box(1, i, 0, r=1, g=1, b=0, alpha=1)
    voxelamming.create_box(2, i, 0, r=0, g=1, b=1, alpha=1)

# ボクセルを削除するため、位置を設定します
for i in range(50):
    voxelamming.remove_box(0, i * 2 + 1, 0)
    voxelamming.remove_box(1, i * 2, 0)

# ボクセルデータをアプリに送信します。
voxelamming.send_data("main")
# voxelamming.close_connection()
