require_relative "player.rb"
require_relative "board.rb"

class Knight < Player
    attr_accessor :symbol
    def initialize(position, color)
        super(position, color)
        options = {"white" => "\u2658", "black" => "\u265E"}
        @symbol = options[color]
    end

    def potential_moves
        result = []
        vertices = Board.new.vertices
        squares_moved = {
            :upward_left         => [-1, 2],
            :upward_right        => [1, 2],
            :sideways_left_up    => [-2, 1],
            :sideways_right_up   => [2, 1],
            :downward_left       => [-1, -2],
            :downward_right      => [1, -2],
            :sideways_left_down  => [-2, -1],
            :sideways_right_down => [2, -1],
        }
    end
end