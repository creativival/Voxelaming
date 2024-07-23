# voxelammingパッケージからBuildBoxクラスをインポートします
from voxelamming import BuildBox

# Voxelammingアプリに表示されている部屋名を指定してください
room_name = "1000"
# BuildBoxクラスのインスタンスを生成します
build_box = BuildBox(room_name)
# シークレットコマンドで一気に日本の城を作成します
build_box.set_command('japaneseCastle')
# ボクセルデータをアプリに送信します。
build_box.send_data("castle_command")
