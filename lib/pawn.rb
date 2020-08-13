require_relative "player.rb"

class Pawn < Player
    attr_accessor :symbol, :direction, :total_moves, :team
    def initialize(color, starting)
        super(starting)
        options = {"white" => "\u2659", "black" => "\u265F"}
        @team = color
        @symbol = options[color]
        @total_moves = 0
        #in array [x, y], x = number of squares the piece can move horizontally and y = vertically
        @direction = [[0, 1], [0, 2, "must be first move"], [1, 1, "opponent must be present"], [-1, 1, "opponent must be present"]]
    end
end

test = Pawn.new("black", [0, 0])

p test.legal_moves([0, 0])