# coding: shift_jis

#STG�T���v��
#DXRuby�̓Ǎ�
require 'dxruby'

#�^�C�g����
Window.caption = ("�T���v��STG")

#���@�̍쐬
player = Sprite.new(0, 0, Image.load("player.png"))

#�G�@�̍쐬
enemy = Sprite.new(0, 0, Image.new(10, 10, C_GREEN))

player_shot = Sprite.new(0, 0, nil)

#�}�b�v�`�惋�[�v
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
		#�V���b�g�̍쐬(���@)
		player_shot = Sprite.new(player.x + 80, player.y, Image.load("player_shot.png"))
	end

	player_shot.draw

	player_shot.x += 3

	#�G�X�P�[�v�L�[�Ń��[�v�𔲂���
	if Input.key_push?(K_ESCAPE) then
		break
	end
end
