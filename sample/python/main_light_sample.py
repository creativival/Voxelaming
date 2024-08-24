# voxelammingパッケージからVoxelammingクラスをインポートします
from voxelamming_local import Voxelamming

# Voxelammingアプリに表示されている部屋名を指定してください
room_name = "1000"
# Voxelammingクラスのインスタンスを生成します
voxelamming = Voxelamming(room_name)
# ボクセルの設定を行います
voxelamming.set_box_size(1)
voxelamming.set_build_interval(0.01)

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
    voxelamming.create_box(0, i, 0, *color, alpha=1)

# ライトを設定します
voxelamming.set_light(1, 1, 0, r=1, g=0, b=0, alpha=1, intensity=20000, interval=2, light_type='directional')
voxelamming.set_light(0, 1, 1, r=0, g=1, b=0, alpha=1, intensity=20000, interval=3, light_type='spot')
voxelamming.set_light(-1, 1, 0, r=0, g=0, b=1, alpha=1, intensity=20000, interval=5, light_type='point')

# axisコマンドを追加する
voxelamming.set_command('axis')

# ボクセルデータをアプリに送信します。
voxelamming.send_data("main_light_sample")
