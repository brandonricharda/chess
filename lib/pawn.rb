require_relative "player.rb"

class Pawn < Player
    attr_accessor :symbol, :diagonal_coordinates, :legal_movements
    def initialize(position, color)
        super(position, color)
        options = {"white" => "\u2659", "black" => "\u265F"}
        @symbol = options[color]
        @legal_movements = {
            :one_forward    => [0, 1],
            :two_forward    => [0, 2],
            :diagonal_left  => [-1, 1],
            :diagonal_right => [1, 1]
        }
    end
end