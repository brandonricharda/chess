require_relative "player.rb"

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
        single_square = 1
        board_axis_edge = 0
        max_moves_allowing_two_forward = 0
        one_forward = @team == "black" ? [x, y + single_square] : [x, y - single_square]
        two_forward = @team == "black" ? [x, y + (single_square * 2)] : [x, y - (single_square * 2)] unless @total_moves > max_moves_allowing_two_forward
        diagonal_left = @team == "black" ? [x - single_square, y + single_square] : [x - single_square, y - single_square]
        diagonal_right = @team == "black" ? [x + single_square, y + single_square] : [x + single_square, y - single_square]
        [one_forward, two_forward, diagonal_left, diagonal_right].select { |coordinates| coordinates.all? { |axis| axis >= board_axis_edge } }
    end

end