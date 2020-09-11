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
        upward_left = [x - 1, y + 2]
        upward_right = [x + 1, y + 2]
        sideways_left_up = [x - 2, y + 1]
        sideways_right_up = [x + 2, y + 1]
        downward_left = [x - 1, y - 2]
        downward_right = [x + 1, y - 2]
        sideways_left_down = [x - 2, y - 1]
        sideways_right_down = [x + 2, y - 1]
        [upward_left, upward_right, sideways_left_up, sideways_right_up, downward_left, downward_right, sideways_left_down, sideways_right_down].select { |coordinates| coordinates.all? { |axis| axis >= 0 } }
    end
end

test = Knight.new([0, 0], "black")
p test.potential_moves