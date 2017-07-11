# coding: shift_jis

#STG�T���v��
#DXRuby�̓Ǎ�
require 'dxruby'

#�^�C�g����
Window.caption = ("�T���v��STG")

#�G�@�N���X
class Enemy < Sprite

	#������
	def initialize(y)
		@enemy = Sprite.new(620, y, Image.new(30, 30, C_GREEN))
	end

	#�G�@�̕`�恕�ړ�
	def update
		@enemy.draw
		@enemy.x -= 10
	end
end

#���@�N���X
class Player < Sprite

	#������
	def initialize
		@player = Sprite.new(0, 200, Image.load("player.png"))
	end

	#���@�̈ʒu(Y)
	def player_y(num = 0)
		
		if @player.y < 0 then
			@player.y = 0
		elsif @player.y > 450 then
			@player.y = 450
		else
			@player.y += num
		end
	end

	#���@�̈ʒu(X)
	def player_x(num = 0)

		if @player.x < 0 then
			@player.x = 0
		elsif @player.x > 560 then
			@player.x = 560
		else
			@player.x += num
		end
	end

	#���@�̑���&�`��
	def key_move

		@player.draw

		#���Ɉړ�
		if Input.key_down?(K_DOWN) then
			player_y(5)
		end

		#���Ɉړ�
		if Input.key_down?(K_UP) then
			player_y(-5)
		end

		#���Ɉړ�
		if Input.key_down?(K_RIGHT) then
			player_x(5)
		end

		#���Ɉړ�
		if Input.key_down?(K_LEFT) then
			player_x(-5)
		end

		#�V���b�g����(���@)
		if Input.key_push?(K_Z) then
			$player_shot << PlayerShot.new(player_x, player_y)
		end
	end
end

#���@�V���b�g�N���X
class PlayerShot < Sprite

	#������
	def initialize(x, y)
		@player_shot = Sprite.new(x + 80, y, Image.load("player_shot.png")) 
	end

	#�V���b�g(���@)�̕`�恕�ړ�
	def update
		@player_shot.draw
		@player_shot.x += 10
	end
end

#�G�@�o���p�֐�
def EnemyAppear(count)

	if count % 10 == 0 then
		$enemy << Enemy.new(rand(400))
	end
end

#���@�̐���
player = Player.new

#�V���b�g(���@)���G�@�̊i�[�z��
$player_shot = []
$enemy = []

#�G�@�o���p�ϐ�
count = 0

#�}�b�v�`�惋�[�v
Window.loop do

	#���@�̑���
	player.key_move

	#�V���b�g(���@)�ƓG�@�̕`�揈��
	Sprite.update([$player_shot, $enemy])

	#�G�@�o������
	EnemyAppear(count)
	count += 1
	
	#�G�X�P�[�v�L�[�Ń��[�v�𔲂���
	if Input.key_push?(K_ESCAPE) then
		break
	end
end
