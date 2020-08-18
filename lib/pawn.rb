require_relative "player.rb"

class Pawn < Player
    attr_accessor :symbol, :direction, :total_moves, :team
    def initialize(position, color)
        super(position, color)
        options = {"white" => "\u2659", "black" => "\u265F"}
        @symbol = options[color]
        @direction = potential_moves
    end

    def potential_moves
        result = []
        x = @position[0]
        y = @position[1]

        #I've decided it's much easier to list the potential moves in this method and evaluate them in the Game class.
        #Identifying valid moves requires access to the board, which is clunky to implement on a player level, especially given the board's dynamic nature.

        #one square forward
        result << [x, y + 1]
        #two squares forward
        result << [x, y + 2]
        #diagonal right
        result << [x + 1, y + 1]
        #diagonal left
        result << [x - 1, y + 1]
        @direction = result
    end

end

test = Pawn.new([0, 0], "black")

p test.direction