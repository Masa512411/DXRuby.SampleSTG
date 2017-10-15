#Player Class
class Player < Sprite
    #初期化
    def initialize
        super
        self.image = Image.load("player.png")
        self.x = 0
        self.y = 200
    end

    #キー操作
    def KeyMove

        self.draw
        
        if Input.key_down?(K_UP) then
            self.y -= 5
        elsif Input.key_down?(K_DOWN) then
            self.y += 5
        elsif Input.key_down?(K_RIGHT) then
            self.x += 5
        elsif Input.key_down?(K_LEFT) then
            self.x -= 5
        end

        #ショット
        if Input.key_push?(K_Z) then
            $PlayerShot << PlayerShot.new(self.x, self.y)
        end
    end

    def hit(obj)
        self.vanish
    end
end

#PlayerShot
class PlayerShot < Sprite
    #初期化
    def initialize(x, y)
        super
        self.image = Image.load("player_shot.png")
        self.x = x + 80
        self.y = y
    end

    def update
        self.draw
        self.x += 10

        if self.x > 680 then
            self.vanish
        end
    end

    def shot(obj)
        self.vanish
    end
end

#PlayerSub
class PlayerSub < Player
    #初期化
    def initialize(x, y)
        self.image = Image.new(30, 30, C_WHITE)
        self.x = x
        self.y = y + 50
    end

    def update(x, y)
        self.draw
        self.x = x - 10
        self.y = y - 10
    end
end