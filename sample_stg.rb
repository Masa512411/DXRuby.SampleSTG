# coding: shift_jis

#STGサンプル
#DXRubyの読込
require 'dxruby'

#タイトル名
Window.caption = ("サンプルSTG")

#敵機クラス
class Enemy < Sprite

	#初期化
	def initialize(y)
		@enemy = Sprite.new(620, y, Image.new(30, 30, C_GREEN))
	end

	#敵機の描画＆移動
	def update
		@enemy.draw
		@enemy.x -= 10
	end
end

#自機クラス
class Player < Sprite

	#初期化
	def initialize
		@player = Sprite.new(0, 200, Image.load("player.png"))
	end

	#自機の位置(Y)
	def player_y(num = 0)
		
		if @player.y < 0 then
			@player.y = 0
		elsif @player.y > 450 then
			@player.y = 450
		else
			@player.y += num
		end
	end

	#自機の位置(X)
	def player_x(num = 0)

		if @player.x < 0 then
			@player.x = 0
		elsif @player.x > 560 then
			@player.x = 560
		else
			@player.x += num
		end
	end

	#自機の操作&描画
	def key_move

		@player.draw

		#↓に移動
		if Input.key_down?(K_DOWN) then
			player_y(5)
		end

		#↑に移動
		if Input.key_down?(K_UP) then
			player_y(-5)
		end

		#→に移動
		if Input.key_down?(K_RIGHT) then
			player_x(5)
		end

		#←に移動
		if Input.key_down?(K_LEFT) then
			player_x(-5)
		end

		#ショット生成(自機)
		if Input.key_push?(K_Z) then
			$player_shot << PlayerShot.new(player_x, player_y)
		end
	end
end

#自機ショットクラス
class PlayerShot < Sprite

	#初期化
	def initialize(x, y)
		@player_shot = Sprite.new(x + 80, y, Image.load("player_shot.png")) 
	end

	#ショット(自機)の描画＆移動
	def update
		@player_shot.draw
		@player_shot.x += 10
	end
end

#敵機出現用関数
def EnemyAppear(count)

	if count % 10 == 0 then
		$enemy << Enemy.new(rand(400))
	end
end

#自機の生成
player = Player.new

#ショット(自機)＆敵機の格納配列
$player_shot = []
$enemy = []

#敵機出現用変数
count = 0

#マップ描画ループ
Window.loop do

	#自機の操作
	player.key_move

	#ショット(自機)と敵機の描画処理
	Sprite.update([$player_shot, $enemy])

	#敵機出現処理
	EnemyAppear(count)
	count += 1
	
	#エスケープキーでループを抜ける
	if Input.key_push?(K_ESCAPE) then
		break
	end
end
