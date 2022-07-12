#簡略化のため、rock-paper-scissorsをrpsと表記

require_relative "rps.rb"
require_relative "hoi.rb"

loop do
    #================================================================
    #ジャンケンの処理
    #===============================================================
    rps=Rps.new
    rps.your_choice
    redo unless  (1..3).include?(rps.your_hand)  #1〜3(グー、チョキ、パーを選んだ場合、入力し直す)

    rps.game_result
    rps.check_draw
    redo if rps.retry_game == true #あいこの場合はやり直し

    #================================================================
    #あっち向いてほいの処理
    #===============================================================
    hoi = Hoi.new
    loop do
        hoi.your_direction_select
        redo unless (1..4).include?(hoi.your_direction)
        break
    end

    hoi.pc_direction_select
    hoi.win_flag = rps.rps_win
    hoi.direction_check
    redo if hoi.retry_game == true

    break
    
end
