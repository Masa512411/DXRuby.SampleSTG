#敵クラス
class Enemy < Sprite

    #初期化
    def initialize(y)
        super
        self.x = 680
        self.y = y
        self.image = Image.new(30, 30, C_GREEN)
    end

    #敵機の描画＆移動
    def update
        
        #敵機の描画
        self.draw

        #敵機の移動
        self.x -= 10

        #画面端まで移動後消す
        if self.x < -50 then
            self.vanish
        end
    end

    #攻撃時の処理
    def shot(obj)
        self.vanish
    end

    #
    def hit(obj)
        self.vanish
        $Score += 1
    end
end

#EnemyAppear
def EnemyAppear(count)
    if count % 50 == 0 then
        $Enemy << Enemy.new(rand(400))
    end
end