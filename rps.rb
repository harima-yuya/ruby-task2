class Rps
    DEFAULT_YOUR_HAND = 1       #getで入力するので、defaultの値は何でも良い
    DEFAULT_WIN_LOSE = 0        #getで入力するので、defaultの値は何でも良い
    DEFAULT_RETRY_GAME = false  #あいこの場合はtrueになる。あいこの時のジャンケンの繰り返しに使用する。           
    DEFAULT_ROCK_PAPER_SCISSORS = ["グー","チョキ","パー"]  #選んだ手を配列に代入して出力する
    DEFAULT_RPS_WIN = true #tureだとジャンケンで勝った,falseだと負けた。あっち向いてほいの勝敗判定に使用する
    attr_accessor :your_hand, :win_lose, :retry_game, :rps_win

    def initialize(your_hand = DEFAULT_YOUR_HAND,
                   win_lose = DEFAULT_WIN_LOSE,
                   retry_game = DEFAULT_RETRY_GAME,
                   rock_paper_scissors = DEFAULT_ROCK_PAPER_SCISSORS,
                    rps_win = DEFAULT_RPS_WIN)

        @your_hand = your_hand
        @win_lose = win_lose
        @retry_game = retry_game
        @rock_paper_scissors = rock_paper_scissors
        @rps_win = rps_win
    end

    def your_choice
        @retry_game = false
        puts "-----------------------------------------------------------"
        puts "出す手を選んで、1〜3の数字を入力して下さい"
        #グー、チョキ、パーと１〜３の数字を順に表示。
        @rock_paper_scissors.each_with_index{|item,i| puts "#{ i+1}:#{item}"}
         puts "-----------------------------------------------------------"
         @your_hand=gets.to_i
        
    end

    def game_result           #0~2の数字をランダムに選ぶ。@your_handから引いて、配列rock_paper_scissorsに挿入した場合の勝敗は下記のリストのようになる。
        win_lose_list = {"2"=>"あなたの勝ちです","1"=>"あなたの負けです","0"=>"あいこです"}
        @win_lose = rand(0..2)
        pc_hand = @rock_paper_scissors[@your_hand-1-@win_lose]
        puts "私は#{pc_hand}を出しました"
        puts win_lose_list[win_lose.to_s]
        @rps_win = false      #falseを一旦代入して、ジャンケンに勝っていた場合はtureを代入
        if @win_lose == 2
            @rps_win = true 
        end
    end

    def check_draw          #あいこの場合はretry_gameをtrueにする。
        if @win_lose == 0
            @retry_game = true
        end
    end

end
