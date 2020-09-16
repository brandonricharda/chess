require_relative "player.rb"

class King < Player
    attr_accessor :symbol, :legal_movements
    def initialize(position, color)
        super(position, color)
        options = {"white" => "\u2654", "black" => "\u265A"}
        @symbol = options[color]
        @legal_movements = {
            :upright => [0, 1],
            :sideways => [1, 0],
            :diagonal => [1, 1]
        }
    end
end