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
        @total_moves += 1
    end

    def confirm_moves(legal_movements)
        potential = potential_moves(legal_movements)
        @piece == "Pawn" ? pawn_adjustment(potential) : potential
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
        result
    end

    def pawn_adjustment(potential)
        comparison_operator = @team == "black" ? ">" : "<"
        potential.select { |coordinates| coordinates[1].public_send(comparison_operator, @position[1]) }
    end
end