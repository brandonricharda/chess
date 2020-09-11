require_relative "player.rb"

class Knight < Player
    attr_accessor :symbol
    def initialize(position, color)
        super(position, color)
        options = {"white" => "\u2658", "black" => "\u265E"}
        @symbol = options[color]
    end

    def potential_moves
        x = @position[0]
        y = @position[1]
        single_square = 1
        board_axis_edge = 0
        upward_left = [x - single_square, y + (single_square * 2)]
        upward_right = [x + single_square, y + (single_square * 2)]
        sideways_left_up = [x - (single_square * 2), y + single_square]
        sideways_right_up = [x + (single_square * 2), y + single_square]
        downward_left = [x - single_square, y - (single_square * 2)]
        downward_right = [x + single_square, y - (single_square * 2)]
        sideways_left_down = [x - (single_square * 2), y - single_square]
        sideways_right_down = [x + (single_square * 2), y - single_square]
        [upward_left, upward_right, sideways_left_up, sideways_right_up, downward_left, downward_right, sideways_left_down, sideways_right_down].select { |coordinates| coordinates.all? { |axis| axis >= board_axis_edge } }
    end
end

test = Knight.new([0, 0], "black")
p test.potential_moves