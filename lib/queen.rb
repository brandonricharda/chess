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
        #this works but is hard to read – looking into a means of running each module method for @position to avoid repetition
        top(@position) + right(@position) + bottom(@position) + left(@position) + top_right(@position) + bottom_right(@position) + bottom_left(@position) + top_left(@position)
    end
end