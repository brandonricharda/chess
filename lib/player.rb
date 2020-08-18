require_relative "board.rb"

class Player
    attr_accessor :position, :team, :total_moves
    def initialize(position, color)
        @position = position
        @team = color
        @total_moves = 0
    end
end