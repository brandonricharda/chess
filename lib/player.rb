require_relative "board.rb"

class Player
    attr_accessor :position, :team, :total_moves
    def initialize(position, color)
        @position = position
        @team = color
        @total_moves = 0
    end

    def update_position(destination)
        @position = destination
    end

    def parse_potential_moves(legal_movements)
        result = []
        vertices = Board.new.vertices
        vertices.each do |coordinates|
            comparison = []
            comparison << (coordinates[0] - @position[0]).abs
            comparison << (coordinates[1] - @position[1]).abs
            result << coordinates if legal_movements.values.include?(comparison)
        end
        result
    end
end