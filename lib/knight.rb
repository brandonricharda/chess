require_relative "player.rb"

class Knight < Player
    attr_accessor :symbol, :legal_movements
    def initialize(position, color)
        super(position, color)
        options = {"white" => "\u2658", "black" => "\u265E"}
        @symbol = options[color]
        @legal_movements = {
            # the method that parses these values does so in .abs
            # as a result, all we need are the upright L and sideways L movements
            :upright  => [1, 2],
            :sideways => [2, 1]
        }
    end

    def potential_moves
        parse_potential_moves(@legal_movements)
    end
end