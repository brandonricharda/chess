require_relative "player.rb"

class Pawn < Player
    attr_accessor :symbol, :direction
    def initialize(color, starting)
        super(starting)
        options = {"white" => "\u2659", "black" => "\u265F"}
        @symbol = options[color]
        @total_moves = 0
        #in array [x, y], x = number of squares the piece can move horizontally and y = vertically
        #pawn initializes with two arrays because it has two choices at the first move
        @direction = [[0, 1], [0, 2, "must be first move"], [1, 1, "opponent must be present"]]
    end
end