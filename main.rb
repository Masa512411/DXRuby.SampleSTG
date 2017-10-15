#DXRubyシューティングゲームSample
#ver 0.0.1
# Coding by S.H.

#必要なファイルの読込(DXRuby他)
require 'dxruby'
require_relative 'KeyState'
require_relative 'Player'
require_relative 'Enemy'
require_relative 'System'

#タイトル名
Window.caption = ("DXRubyシューティングゲーム　Ver 0.0.1")

#メッセージボックスオブジェクト生成
messagebox = WIN32OLE.new('WScript.Shell')

#自機オブジェクト生成
player = Player.new

#自機オプション生成
playersub = PlayerSub.new(player.x, player.y)

#ショット配列
$PlayerShot = []

#敵機配列
$Enemy = []

#敵機出現用カウンタ
count = 0

#経過時間カウンタ
$Time = 0

#得点カウンタ
$Score = 0

#フォントオブジェクト生成
font = Font.new(26)

Window.loop do

    #自機の描画＆キー操作
    player.KeyMove

    #自機のショット更新
    playersub.update(player.x, player.y)

    #敵機の更新
    Sprite.update([$PlayerShot, $Enemy])

    #敵機出現関数
    EnemyAppear(count)
    count += 1

    #自機と敵機の衝突判定
    if Sprite.check($Enemy, player) then
        break
    end

    #自弾と敵機との衝突判定
    Sprite.check($PlayerShot, $Enemy)

    #衝突判定で消えたキャラを配列から削除
    Sprite.clean([player, $Enemy, $playerShot])

    #スコアとタイムの表示
    DrawScoreAndTimeNow(font)

    #エスケープキーでゲーム終了
    GameFinish(messagebox)
end

#スコアとタイムの表示
DrawScoreAndTimeEnd(font, messagebox)