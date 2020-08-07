require_relative "player.rb"

class King < Player
    attr_accessor :symbol
    def initialize(color)
        options = {"white" => "\u2654", "black" => "\u265A"}
        @symbol = options[color]
    end
end