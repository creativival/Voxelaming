# voxelammingパッケージからVoxelammingクラスをインポートします
from voxelamming import Voxelamming
# from voxelamming_local import Voxelamming  # ローカルで開発している場合はこちらを使う

# Voxelammingアプリに表示されている部屋名を指定してください
room_name = "1000"
# Voxelammingクラスのインスタンスを生成します
vox = Voxelamming(room_name)

# ボクセルの設定を行います
vox.set_box_size(0.3)
vox.set_build_interval(0.01)
vox.transform(0, 0, 0, pitch=0, yaw=0, roll=0)
vox.animate(0, 0, 10, pitch=0, yaw=30, roll=0, scale=2, interval=0)

# ボクセルを配置するため、位置と色を設定します
for i in range(100):
    alpha = (100 - i) / 100
    vox.create_box(-1, i, 0, r=0, g=1, b=1, alpha=alpha)
    vox.create_box(0, i, 0, r=1, g=0, b=0, alpha=alpha)
    vox.create_box(1, i, 0, r=1, g=1, b=0, alpha=alpha)
    vox.create_box(2, i, 0, r=0, g=1, b=1, alpha=alpha)

for i in range(50):
    vox.remove_box(0, i * 2 + 1, 0)
    vox.remove_box(1, i * 2, 0)

# ボクセルデータをアプリに送信します。
vox.send_data("main_set_alpha_sample")
