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
        if piece.piece == "Pawn"
            return @board.occupancies[move] == opponent if diagonal
            @board.occupancies[move] == nil
        else
            opponent = ["black", "white"].select { |team| team != piece.team }
            [nil, opponent].include?(@board.occupancies[move])
        end
    end

    def determine_capture(piece, move)
        opponent = ["black", "white"].select { |team| team != piece.team }
        @board.occupancies[move] == opponent
    end

    def select_move(team)
        team.selector
        piece = team.selected_piece
        legal_moves = piece.potential_moves(piece.legal_movements).select { |move| validate_move(piece, move) }
        p "#{team.color.upcase} #{piece.piece.upcase}, please enter the move you would like to make."
        move = JSON.parse(gets.chomp)
        until validate_move(piece, move)
            p "Please ensure you have entered a valid move. It should be an array with [x, y] coordinates."
            p "This piece can move to: #{legal_moves}."
            move = JSON.parse(gets.chomp)
        end
        move
    end
end