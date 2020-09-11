require_relative "all_directions.rb"
require_relative "player.rb"
include All_Directions

class Pawn < Player
    attr_accessor :symbol, :diagonal_coordinates
    def initialize(position, color)
        super(position, color)
        options = {"white" => "\u2659", "black" => "\u265F"}
        @symbol = options[color]
    end

    def potential_moves
        forward_one = @team == "black" ? top(@position)[0] : bottom(@position)[-1]
        forward_two = @team == "black" ? top(@position)[1] : bottom(@position)[-2] unless @total_moves > 0
        diagonal_left = @team == "black" ? top_left(@position)[0] : bottom_left(@position)[0]
        diagonal_right = @team == "black" ? top_right(@position)[0] : bottom_right(@position)[0]
        [forward_one, forward_two, diagonal_left, diagonal_right].select { |coordinates| coordinates }
    end

    def diagonal_coordinates
        potential_moves.last(2).select { |coordinates| coordinates[0] != @position[0] }
    end

end