require_relative "player.rb"

class Pawn < Player
    attr_accessor :symbol
    def initialize(color)
        options = {"white" => "\u2659", "black" => "\u265F"}
        @symbol = options[color]
    end
end