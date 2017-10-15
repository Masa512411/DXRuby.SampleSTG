#ゲーム中のスコア＆タイム表示
def DrawScoreAndTimeNow(font) 

    #スコアの表示&タイムの表示
    Window.draw_font(0, 0, "SCORE : #{$Score}", font)
    Window.draw_font(0, 20, "TIME : #{$Time}", font)

    #経過時間の加算
    $Time += 1
end

#ゲーム終了時のスコア＆タイム表示
def DrawScoreAndTimeEnd(font, messagebox)

    #ウインドウを生成
    Window.loop do

        #スコアの表示&タイムの表示
        Window.draw_font(0, 0, "SCORE : #{$Score}", font)
        Window.draw_font(0, 20, "TIME : #{$Time}", font)

        #コンテニュー？表示
        Window.draw_font(300, 400, "CONTINUE ?", font)

        #エスケープキーでゲーム終了
        GameFinish(messagebox)
    end
end