require_relative "player.rb"

class Knight < Player
    attr_accessor :symbol
    def initialize(position, color)
        super(position, color)
        options = {"white" => "\u2658", "black" => "\u265E"}
        @symbol = options[color]
    end

    def potential_moves
        result = []
        x = @position[0]
        y = @position[1]
        #upward L left
        result << [x - 1, y + 2]
        #upward L right
        result << [x + 1, y + 2]
        #sideways L left up
        result << [x - 2, y + 1]
        #sideways L right up
        result << [x + 2, y + 1]
        #downward L left
        result << [x - 1, y - 2]
        #downward L right
        result << [x + 1, y - 2]
        #sideways L left down
        result << [x - 2, y - 1]
        #sideways L right down
        result << [x + 2, y - 1]
        result.select { |coordinates| coordinates.all? { |axis| axis >= 0 } }
    end
end