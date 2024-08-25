from time import sleep
# voxelammingパッケージからVoxelammingクラスをインポートします
from voxelamming_local import Voxelamming

# Voxelammingアプリに表示されている部屋名を指定してください
room_name = "1000"
# Voxelammingクラスのインスタンスを生成します
vox = Voxelamming(room_name)
# ボクセルの設定を行います
vox.set_box_size(0.5)
vox.set_build_interval(0.01)

for i in range(10):
    vox.create_box(-1, i, 0, r=0, g=1, b=1)
    vox.create_box(0, i, 0, r=1, g=0, b=0)
    vox.create_box(1, i, 0, r=1, g=1, b=0)
    vox.create_box(2, i, 0, r=0, g=1, b=1)

for i in range(5):
    vox.remove_box(0, i * 2 + 1, 0)
    vox.remove_box(1, i * 2, 0)

# ボクセルデータをアプリに送信します。（1回目）
vox.send_data()

# 1秒待機します
sleep(0.1)

vox.animate(10, 0, 0, pitch=0, yaw=30, roll=0, scale=2, interval=10)

# ボクセルデータをアプリに送信します。（2回目）
vox.send_data()
