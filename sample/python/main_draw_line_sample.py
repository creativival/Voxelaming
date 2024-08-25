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
# vox.set_command('float')

# draw_lineメソッドを使って直線を描画します
vox.draw_line(0, 0, 0, 5, 10, 20, r=1, g=0, b=0, alpha=1)
vox.send_data()

# ボクセルデータをアプリに送信します。
vox.send_data("main_draw_line_sample")
