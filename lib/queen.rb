require_relative "player.rb"

class Queen < Player
    attr_accessor :symbol
    def initialize(color)
        options = {"white" => "\u2655", "black" => "\u265B"}
        @symbol = options[color]
    end
end