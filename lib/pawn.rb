require_relative "player.rb"

class Pawn < Player
    attr_accessor :symbol, :direction, :total_moves, :team
    def initialize(position, color)
        super(position, color)
        options = {"white" => "\u2659", "black" => "\u265F"}
        @symbol = options[color]
    end

    def potential_moves
        result = []
        x = @position[0]
        y = @position[1]
        #one square forward
        result << [x, y + 1]
        #two squares forward
        result << [x, y + 2]
        #diagonal right
        result << [x + 1, y + 1]
        #diagonal left
        result << [x - 1, y + 1]
        result
    end

end