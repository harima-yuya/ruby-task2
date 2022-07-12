class Hoi
    attr_accessor :your_direction, :retry_game, :win_flag
    DEFAULT_YOR_DIRECTION = 1
    DEFAULT_PC_DIRECTION = 1
    DEFAULT_DIRECTION_LIST = ["上","下","左","右"]
    DEFAULT_RETRY_GAME = false
    DEFAULT_WIN_FLAG = true #trueなら同じ方向を向いたら勝ち、falseなら同じ方向を向いたら負け
    def initialize(your_direction = DEFAULT_YOR_DIRECTION,
                   pc_direction = DEFAULT_PC_DIRECTION,
                   direction_list = DEFAULT_DIRECTION_LIST,
                   retry_game = DEFAULT_RETRY_GAME,
                   win_flag = DEFAULT_WIN_FLAG)
        @your_direction = your_direction
        @pc_direction = pc_direction
        @direction_list = direction_list
        @retry_game = retry_game
        @win_flag = win_flag
    end

    def your_direction_select
        puts "-----------------------------------------------------------"
        puts "向く方向を選んで、1~4の数字を入力して下さい。"
        #上下、左右と１〜4の数字を順に表示
        @direction_list.each_with_index{|item,i| puts "#{ i+1}:#{item}"}
         puts "-----------------------------------------------------------"
        @your_direction = gets.to_i
    end

    def pc_direction_select
        @pc_direction = rand(0..@direction_list.length-1)
        _pc_direction = @direction_list[@pc_direction]
        puts "私は#{_pc_direction}を向きました"
    end

    def direction_check
        if @pc_direction != @your_direction - 1
            puts "残念！違う方向を向きました!"
            @retry_game = true
        else 
            @retry_game = false
            if @win_flag == true
                puts "あなたの勝ちです"
            else 
                puts "私の勝ちです"
            end
        end
    end

end

