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
        x = @position[0]
        y = @position[1]
        forward_one = @team == "black" ? [x, y + 1] : [x, y - 1]
        forward_two = @team == "black" ? [x, y + 2] : [x, y - 2] unless @total_moves > 0
        diagonal_left = @team == "black" ? [x - 1, y + 1] : [x - 1, y - 1]
        diagonal_right = @team == "black" ? [x + 1, y + 1] : [x + 1, y - 1]
        [forward_one, forward_two, diagonal_left, diagonal_right].select { |coordinates| coordinates.all? { |axis| axis >= 0 } }
    end

end