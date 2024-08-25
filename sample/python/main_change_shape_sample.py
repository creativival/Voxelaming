import time
# voxelammingパッケージからVoxelammingクラスをインポートします
from voxelamming import Voxelamming
# from voxelamming_local import Voxelamming  # ローカルで開発している場合はこちらを使う

# Voxelammingアプリに表示されている部屋名を指定してください
room_name = "1000"
# Voxelammingクラスのインスタンスを生成します
vox = Voxelamming(room_name)
# ボクセルの設定を行います
vox.set_box_size(0.5)
vox.set_build_interval(0.01)

# ボクセルを配置するため、位置と色を設定します
for i in range(10):
    vox.create_box(-1, i, 0, r=0, g=1, b=1, alpha=1)
    vox.create_box(0, i, 0, r=1, g=0, b=0, alpha=1)
    vox.create_box(1, i, 0, r=1, g=1, b=0, alpha=1)
    vox.create_box(2, i, 0, r=0, g=1, b=1, alpha=1)

for i in range(5):
    vox.remove_box(0, i * 2 + 1, 0)
    vox.remove_box(1, i * 2, 0)

vox.send_data('box')  # ボクセルデータをアプリに送信します。

time.sleep(0.1)

vox.transform(10, 0, 0, pitch=0, yaw=0, roll=0)
vox.change_shape('sphere')
vox.send_data('sphere')  # sphereのボクセルデータをアプリに送信します。

time.sleep(0.1)

vox.transform(20, 0, 0, pitch=0, yaw=0, roll=0)
vox.change_shape('plane')
# ボクセルデータをアプリに送信します。
vox.send_data('plane')  # planeのボクセルデータをアプリに送信します。
