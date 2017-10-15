# KeyState

# win32oleの読込
require 'win32ole'

def GameFinish(messagebox)
    if Input.key_push?(K_ESCAPE) then
        if messagebox.Popup("ゲームを終了しますか？", 0, "STG", 4 + 32 ) == 6 then
            exit
        end
    end
end