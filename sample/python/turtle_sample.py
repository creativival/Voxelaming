# voxelammingパッケージからVoxelammingクラスとTurtleクラスをインポートします
# from voxelamming import Voxelamming, Turtle
from voxelamming_local import Voxelamming
from turtle import Turtle

# Voxelammingアプリに表示されている部屋名を指定してください
room_name = "1000"
# Voxelammingクラスのインスタンスを生成します
voxelamming = Voxelamming(room_name)
# ボクセルの設定を行います
voxelamming.set_box_size(0.3)
voxelamming.set_build_interval(0.01)

# ボクセルを配置するため、位置と色を設定します
t = Turtle(voxelamming)

t.set_color(1, 0, 0, 1)

t.forward(10)
t.left(90)
t.forward(10)
t.left(90)
t.forward(10)
t.left(90)
t.forward(10)
t.left(90)

t.up(90)
t.forward(10)
t.down(90)

t.forward(10)
t.left(90)
t.forward(10)
t.left(90)
t.forward(10)
t.left(90)
t.forward(10)

# ボクセルデータをアプリに送信します。
voxelamming.send_data("turtle_sample")
