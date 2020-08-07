require_relative "player.rb"

class Bishop < Player
    attr_accessor :symbol
    def initialize(color)
        options = {"white" => "\u2657", "black" => "\u265D"}
        @symbol = options[color]
    end
end