# voxelammingパッケージからBuildBoxクラスをインポートします
from voxelamming import BuildBox
from ply_util import get_boxes_from_ply

ply_file_name = '../ply_file/piyo.ply'

# Voxelammingアプリに表示されている部屋名を指定してください
room_name = "1000"
# BuildBoxクラスのインスタンスを生成します
build_box = BuildBox(room_name)

# ボクセルの設定を行います
build_box.set_box_size(1)
build_box.set_build_interval(0.01)

# ボクセルを配置するため、位置と色を設定します
boxes = get_boxes_from_ply(ply_file_name)

for box in boxes:
    build_box.create_box(*box)

# ボクセルデータをアプリに送信します。
build_box.send_data("main_make_model_sample")
