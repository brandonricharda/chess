require_relative "board.rb"

class Player
    attr_accessor :position, :team, :total_moves, :piece
    def initialize(position, color)
        @piece = self.class.to_s
        @position = position
        @team = color
        @total_moves = 0
    end

    def update_position(destination)
        @position = destination
    end

    def potential_moves(legal_movements)
        result = []
        vertices = Board.new.vertices
        vertices.each do |coordinates|
            comparison = []
            comparison << (coordinates[0] - @position[0]).abs
            comparison << (coordinates[1] - @position[1]).abs
            result << coordinates if legal_movements.values.include?(comparison)
        end

        if @piece == "Pawn"
            #compensates for board being oriented from black team's perspective
            comparison_operator = @team == "black" ? ">" : "<"
            result.select { |coordinates| coordinates[1].public_send(comparison_operator, @position[1]) }
        else
            result
        end
    end
end