require_relative "all_directions.rb"
require_relative "player.rb"
include All_Directions

class Bishop < Player
    attr_accessor :symbol
    def initialize(position, color)
        super(position, color)
        options = {"white" => "\u2657", "black" => "\u265D"}
        @symbol = options[color]
    end

    def potential_moves
        top_left(@position) + top_right(@position) + bottom_right(@position) + bottom_left(@position)
    end

end