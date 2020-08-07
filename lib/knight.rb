require_relative "player.rb"

class Knight < Player
    attr_accessor :symbol
    def initialize(color)
        options = {"white" => "\u2658", "black" => "\u265E"}
        @symbol = options[color]
    end
end