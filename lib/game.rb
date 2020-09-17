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
        # if piece is pawn, we need to check two things
        if piece.piece == "Pawn"
            # if the move is diagonal...
            if (move[0] - piece.position[0]).abs == 1
                # an opponent must be present
                @board.occupancies[move] == ["black", "white"].select { |team| team != piece.team }
            else
                # if move is not diagonal, it must merely be empty
                @board.occupancies[move] == nil && piece.potential_moves(piece.legal_movements).include?(move)
            end
        else
            #add rules for other pieces here
        end
    end

end