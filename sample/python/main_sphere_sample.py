# voxelammingパッケージからVoxelammingクラスをインポートします
from voxelamming import Voxelamming
# from voxelamming_local import Voxelamming  # ローカルで開発している場合はこちらを使う

# 球体の半径を設定する
radius = 11

# Voxelammingアプリに表示されている部屋名を指定してください
room_name = "1000"
# Voxelammingクラスのインスタンスを生成します
vox = Voxelamming(room_name)

# ボクセルの設定を行います
vox.set_box_size(2)
vox.set_build_interval(0.01)

# ボクセルを配置するため、位置と色を設定します
for i in range(-radius, radius + 1):
    for j in range(-radius, radius + 1):
        for k in range(-radius, radius + 1):
            if (radius - 1) ** 2 <= i ** 2 + j ** 2 + k ** 2 < radius ** 2:
                print(i, j, k)
                vox.create_box(i, j, k, 0, 1, 1)

# ボクセルデータをアプリに送信します。
vox.send_data("main_sphere_sample")
