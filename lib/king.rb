require_relative "player.rb"

class King < Player
    attr_accessor :symbol
    def initialize(position, color)
        super(position, color)
        options = {"white" => "\u2654", "black" => "\u265A"}
        @symbol = options[color]
    end

    def potential_moves
        result = []
        x = @position[0]
        y = @position[1]
        #one forward
        result << [x, y + 1]
        #one backward
        result << [x, y - 1]
        #one right
        result << [x + 1, y]
        #one left
        result << [x - 1, y]
        #diagonal up right
        result << [x + 1, y + 1]
        #diagonal up left
        result << [x - 1, y + 1]
        #diagonal down right
        result << [x + 1, y - 1]
        #diagonal down left
        result << [x - 1, y - 1]
        result.select { |coordinates| coordinates.all? { |axis| axis >= 0 } }
    end
end