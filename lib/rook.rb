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
        left(@position) + top(@position) + right(@position) + bottom(@position)
    end

end