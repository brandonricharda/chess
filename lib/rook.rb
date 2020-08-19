require_relative "player.rb"

class Rook < Player
    attr_accessor :symbol, :direction
    def initialize(position, color)
        super(position, color)
        options = {"white" => "\u2656", "black" => "\u265C"}
        @symbol = options[color]
        @direction = determine_direction
    end

    def potential_moves
        
    end

end