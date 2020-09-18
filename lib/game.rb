Dir["*.rb"].each { |file| require_relative file unless file == "game.rb" }
require "json"

class Game
    attr_accessor :board, :black_team, :white_team
    def initialize
        @board = Board.new
        @black_team = Team.new("black")
        @white_team = Team.new("white")
    end

    def validate_move(piece, move)
        return false unless piece.potential_moves(piece.legal_movements).include?(move)
        opponent = ["black", "white"].select { |team| team != piece.team }
        diagonal = (move[0] - piece.position[0]).abs == 1

        if piece.pece == "Pawn"
            return @board.occupancies[move] == opponent if diagonal
            return @board.occupancies[move] == nil
        else
            opponent = ["black", "white"].select { |team| team != piece.team }
            [nil, opponent].include?(@board.occupancies[move])
        end
        
    end

end