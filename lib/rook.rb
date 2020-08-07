require_relative "player.rb"

class Rook < Player
    attr_accessor :symbol
    def initialize(color)
        options = {"white" => "\u2656", "black" => "\u265C"}
        @symbol = options[color]
    end
end