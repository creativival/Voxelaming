# voxelammingパッケージからVoxelammingクラスをインポートします
from voxelamming_local import Voxelamming
from ply_util import get_boxes_from_ply

ply_file_name = '../ply_file/piyo.ply'

# Voxelammingアプリに表示されている部屋名を指定してください
room_name = "1000"
# Voxelammingクラスのインスタンスを生成します
voxelamming = Voxelamming(room_name)

# ボクセルの設定を行います
voxelamming.set_box_size(1)
voxelamming.set_build_interval(0.01)

# ボクセルを配置するため、位置と色を設定します
boxes = get_boxes_from_ply(ply_file_name)

for box in boxes:
    voxelamming.create_box(*box)

# ボクセルデータをアプリに送信します。
voxelamming.send_data("main_make_model_sample")
