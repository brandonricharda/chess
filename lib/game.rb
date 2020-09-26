Dir["*.rb"].each { |file| require_relative file unless file == "game.rb" }
require "json"

class Game
    attr_accessor :board, :black_team, :white_team
    def initialize
        @board = Board.new
        @black_team = Team.new("black")
        @white_team = Team.new("white")
        @messages = {
            "enter_move" => "Please enter the move you would like to make.",
            "invalid_move" => "Please ensure you have entered a valid move. It should be an array with [x, y] coordinates."
        }
    end

    def validate_move(piece, move)
        return false if impossible_move?(piece, move)
        piece.piece == "Pawn" ? legal_pawn_move?(piece, move) : legal_non_pawn_move?(piece, move)
    end

    def legal_non_pawn_move?(piece, move)
        empty_square?(move) || opponent_present?(piece, move)
    end

    def legal_pawn_move?(piece, move)
        diagonal?(piece, move) ? opponent_present?(piece, move) : empty_square?(move)
    end

    def empty_square?(move)
        @board.occupancies[move] == nil
    end

    def opponent_present?(piece, move)
        @board.occupancies[move] == identify_opponent(piece)
    end

    def diagonal?(piece, move)
        (move[0] - piece.position[0]).abs == 1
    end

    def identify_opponent(piece)
        [@black_team, @white_team].select { |team| team.color != piece.team }
    end

    def impossible_move?(piece, move)
        !piece.confirm_moves(piece.legal_movements).include?(move)
    end

    def determine_capture(piece, move)
        @board.occupancies[move] == identify_opponent(piece)
    end

    def collect_potential_moves(piece)
        piece.confirm_moves(piece.legal_movements).select { |move| validate_move(piece, move) }
    end

    def select_move(team)
        team.selector
        piece = team.selected_piece
        p @messages["enter_move"]
        move = JSON.parse(gets.chomp)
        until validate_move(piece, move)
            p @messages["invalid_move"]
            move = JSON.parse(gets.chomp)
        end
        [piece, move]
    end

    def opposing_piece(team, move)
        @board.occupancies[move]
    end

    def make_move(team)
        piece_move = select_move(team)
        piece = piece_move[0]
        move = piece_move[1]
        identify_opponent(piece).eliminate(opposing_piece(team, move)) if opponent_present?(piece, move)
        piece.update_position(move)
    end
end