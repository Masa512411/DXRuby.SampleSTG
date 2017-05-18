# coding: shift_jis

#STGサンプル
#DXRubyの読込
require 'dxruby'

#タイトル名
Window.caption = ("サンプルSTG")

#自機の作成
player = Sprite.new(0, 0, Image.load("player.png"))

#敵機の作成
enemy = Sprite.new(0, 0, Image.new(10, 10, C_GREEN))

player_shot = Sprite.new(0, 0, nil)

#マップ描画ループ
Window.loop do

	player.draw

	if Input.key_down?(K_DOWN) then
		player.y += 5
	end

	if Input.key_down?(K_UP) then
		player.y -= 5
	end

	if Input.key_down?(K_RIGHT) then
		player.x += 5
	end

	if Input.key_down?(K_LEFT) then
		player.x -= 5
	end

	if Input.key_down?(K_Z) then
		#ショットの作成(自機)
		player_shot = Sprite.new(player.x + 80, player.y, Image.load("player_shot.png"))
	end

	player_shot.draw

	player_shot.x += 3

	#エスケープキーでループを抜ける
	if Input.key_push?(K_ESCAPE) then
		break
	end
end
