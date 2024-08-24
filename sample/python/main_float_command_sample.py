from time import sleep
from math import sin, cos, radians, pi, sqrt
# voxelammingパッケージからVoxelammingクラスをインポートします
from voxelamming_local import Voxelamming

# Voxelammingアプリに表示されている部屋名を指定してください
room_name = "1000"
size = 1
radius = 1.5
repeat_count = 100

# Voxelammingクラスのインスタンスを生成します
voxelamming = Voxelamming(room_name)
# ボクセルの設定を行います
voxelamming.set_build_interval(0.01)
voxelamming.set_box_size(size)
voxelamming.change_shape("sphere")
voxelamming.set_command('float')

# ボクセルを配置するため、位置と色を設定します
for i in range(repeat_count):
    angle = radians(i * 720 / repeat_count)
    x = radius * cos(angle)
    y = i
    z = radius * sin(angle)

    voxelamming.create_box(x, y, z, r=0, g=1, b=1, alpha=1)
    voxelamming.create_box(-x, y, -z, r=0, g=1, b=1, alpha=1)
    if i % 2 == 0:
        voxelamming.create_box(x / 3, y, z / 3, r=1, g=0, b=0, alpha=1)
    else:
        voxelamming.create_box(-x / 3, y, -z / 3, r=1, g=1, b=0, alpha=1)

# ボクセルデータをアプリに送信します。
voxelamming.send_data("main_float_command_sample")
