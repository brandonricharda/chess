require_relative "player.rb"

class Bishop < Player
    attr_accessor :symbol
    def initialize(position, color)
        super(position, color)
        options = {"white" => "\u2657", "black" => "\u265D"}
        @symbol = options[color]
    end

    def potential_moves
        result = []
        x = @position[0]
        y = @position[1]

        until x == 0 || y == 0
            x -= 1
            y -= 1
        end

        until x > 7 || y > 7
            result << [x, y] unless [x, y] == @position
            x += 1
            y += 1
        end

        result

    end

end