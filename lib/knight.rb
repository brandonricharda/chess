require_relative "player.rb"

class Knight < Player
    attr_accessor :symbol, :legal_movements
    def initialize(position, color)
        super(position, color)
        options = {"white" => "\u2658", "black" => "\u265E"}
        @symbol = options[color]
        @legal_movements = {
            :upright  => [1, 2],
            :sideways => [2, 1]
        }
    end
end