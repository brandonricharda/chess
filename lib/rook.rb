require_relative "player.rb"

class Rook < Player
    attr_accessor :symbol, :legal_movements
    def initialize(position, color)
        super(position, color)
        options = {"white" => "\u2656", "black" => "\u265C"}
        @symbol = options[color]
        @legal_movements = {
            :first_vertical_layer     => [0, 1],
            :second_vertical_layer    => [0, 2],
            :third_vertical_layer     => [0, 3],
            :fourth_vertical_layer    => [0, 4],
            :fifth_vertical_layer     => [0, 5],
            :sixth_vertical_layer     => [0, 6],
            :seventh_vertical_layer   => [0, 7],

            :first_horizontal_layer   => [1, 0],
            :second_horizontal_layer  => [2, 0],
            :third_horizontal_layer   => [3, 0],
            :fourth_horizontal_layer  => [4, 0],
            :fifth_horizontal_layer   => [5, 0],
            :sixth_horizontal_layer   => [6, 0],
            :seventh_horizontal_layer => [7, 0],
        }
    end
end