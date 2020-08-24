require_relative "all_directions.rb"
require_relative "player.rb"
include All_Directions

class Queen < Player
    attr_accessor :symbol
    def initialize(position, color)
        super(position, color)
        options = {"white" => "\u2655", "black" => "\u265B"}
        @symbol = options[color]
    end

    def potential_moves
        x = @position[0]
        y = @position[1]
        diagonal(x, y, @position) + linear(x, y, @position, @team)
    end
end