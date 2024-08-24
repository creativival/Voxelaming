# voxelammingパッケージからVoxelammingクラスをインポートします
from voxelamming import Voxelamming
# from voxelamming_local import Voxelamming  # ローカルで開発している場合はこちらを使う

# Voxelammingアプリに表示されている部屋名を指定してください
room_name = "1000"
# Voxelammingクラスのインスタンスを生成します
voxelamming = Voxelamming(room_name)
# シークレットコマンドで一気に日本の城を作成します
voxelamming.set_command('japaneseCastle')
# ボクセルデータをアプリに送信します。
voxelamming.send_data("castle_command")
