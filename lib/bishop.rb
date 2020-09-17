require_relative "player.rb"

class Bishop < Player
    attr_accessor :symbol, :legal_movements
    def initialize(position, color)
        super(position, color)
        options = {"white" => "\u2657", "black" => "\u265D"}
        @symbol = options[color]
        @legal_movements = {
            :first_layer   => [1, 1],
            :second_layer  => [2, 2],
            :third_layer   => [3, 3],
            :fourth_layer  => [4, 4],
            :fifth_layer   => [5, 5],
            :sixth_layer   => [6, 6],
            :seventh_layer => [7, 7]
        }
    end
end