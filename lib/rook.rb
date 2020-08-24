require_relative "all_directions.rb"
require_relative "player.rb"
include All_Directions

class Rook < Player
    attr_accessor :symbol
    def initialize(position, color)
        super(position, color)
        options = {"white" => "\u2656", "black" => "\u265C"}
        @symbol = options[color]
    end

    def potential_moves
        x = @position[0]
        y = @position[1]
        linear(x, y, @position, @team)
    end

end