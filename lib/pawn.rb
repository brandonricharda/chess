require_relative "all_directions.rb"
require_relative "player.rb"
include All_Directions

class Pawn < Player
    attr_accessor :symbol
    def initialize(position, color)
        super(position, color)
        options = {"white" => "\u2659", "black" => "\u265F"}
        @symbol = options[color]
    end

    def potential_moves(diagonal)
        result = []
        if @team == "black"
            result << top(@position)[0]
            result << top(@position)[1] unless @total_moves > 0
            result << top_left(@position)[-1] unless !diagonal
            result << top_right(@position)[0] unless !diagonal
        elsif @team == "white"
            result << bottom(@position)[-1]
            result << bottom(@position)[-2] unless @total_moves > 0
            result << bottom_left(@position)[0] unless !diagonal
            result << bottom_right(@position)[-1] unless !diagonal
        end
        result.select { |coordinates| coordinates }
    end

end