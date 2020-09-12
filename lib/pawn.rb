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
        min_board_edge = 0
        max_board_edge = 7
        max_moves_allowing_two_forward = 0
        if @team == "black"
            one_forward = [x, y + single_square]
            two_forward = [x, y + (single_square * 2)] unless @total_moves > max_moves_allowing_two_forward
            diagonal_left = [x - single_square, y + single_square]
            diagonal_right = [x + single_square, y + single_square]
        elsif @team == "white"
            one_forward = [x, y - single_square]
            two_forward = [x, y - (single_square * 2)] unless @total_moves > max_moves_allowing_two_forward
            diagonal_left = [x - single_square, y - single_square]
            diagonal_right = [x + single_square, y - single_square]
        end
        [one_forward, two_forward, diagonal_left, diagonal_right].select do |coordinates|
            coordinates.all? { |axis| (min_board_edge..max_board_edge).include?(axis) }
        end
    end

end