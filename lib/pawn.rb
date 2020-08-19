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

        if @team == "black"
            #one square forward
            result << [x, y + 1]
            #two squares forward unless it's not first move
            result << [x, y + 2] unless @total_moves > 0
            #diagonal right
            result << [x + 1, y + 1]
            #diagonal left
            result << [x - 1, y + 1]
        elsif @team == "white"
            #same as above, except adjusted to account for opposite player
            #since the board always remains in the same player (black) perspective
            result << [x, y - 1]
            result << [x, y - 2] unless @total_moves > 0
            result << [x + 1, y - 1]
            result << [x - 1, y - 1]
        end

        #weeds out any moves that would be off the board
        #I may want to move this to the player or game class to avoid repetition
        result = result.select { |coordinates| coordinates.all? { |axis| axis <= 7 && axis >= 0 } }
        result

    end

end

test = Pawn.new([7, 7], "white")

p test.potential_moves