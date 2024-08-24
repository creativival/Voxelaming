import time
# voxelammingパッケージからVoxelammingクラスをインポートします
from voxelamming import Voxelamming
# from voxelamming_local import Voxelamming  # ローカルで開発している場合はこちらを使う

# Voxelammingアプリに表示されている部屋名を指定してください
room_name = "1000"
# Voxelammingクラスのインスタンスを生成します
voxelamming = Voxelamming(room_name)
# ボクセルの設定を行います
voxelamming.set_box_size(0.5)
voxelamming.set_build_interval(0.01)
# voxelamming.set_command('float')

# draw_lineメソッドを使って直線を描画します
voxelamming.draw_line(0, 0, 0, 5, 10, 20, r=1, g=0, b=0, alpha=1)
voxelamming.send_data()

# ボクセルデータをアプリに送信します。
voxelamming.send_data("main_draw_line_sample")
