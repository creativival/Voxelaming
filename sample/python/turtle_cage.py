# voxelammingパッケージからVoxelammingクラスとTurtleクラスをインポートします
from voxelamming import Voxelamming, Turtle
# from voxelamming_local import Voxelamming, Turtle

# Voxelammingアプリに表示されている部屋名を指定してください
room_name = "1000"
# Voxelammingクラスのインスタンスを生成します
vox = Voxelamming(room_name)
# ボクセルの設定を行います
vox.set_box_size(0.3)
vox.set_build_interval(0.01)
vox.set_command('liteRender')  # 描画を軽くするためのコマンド

# ボクセルを配置するため、位置と色を設定します
t = Turtle(vox)

# 線の色のリスト
colors = [
    [0, 0, 0, 1],
    [1, 0, 0, 1],
    [0, 1, 0, 1],
    [0, 0, 1, 1],
    [1, 1, 0, 1],
    [0, 1, 1, 1],
    [1, 0, 1, 1],
    [1, 1, 1, 1],
    [0.5, 0, 0, 1],
    [0, 0.5, 0, 1],
    [0, 0, 0.5, 1],
    [0.5, 0.5, 0, 1],
    [0, 0.5, 0.5, 1],
    [0.5, 0, 0.5, 1],
    [0.5, 0.5, 0.5, 1],
]

# 色を変えながら鳥籠を描画します
for i, color in enumerate(colors):
    polar_phi = i * 180 / len(colors)
    t.reset()
    t.set_color(*color)
    t.left(polar_phi)

    for _ in range(60):
        t.forward(4)
        t.up(6)

# ボクセルデータをアプリに送信します。
vox.send_data("turtle_cage")
