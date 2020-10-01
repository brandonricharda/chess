Dir["*.rb"].each { |file| require_relative file unless file == "game.rb" }
require "json"
include BoardHelper

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

    def play_game
        until winner?
            [@black_team, @white_team].each do |team|
                break if winner?
                make_move(team)
            end
        end
    end

    def make_move(team)
        piece = select_piece(team)
        move = select_move(piece)
        opposing_team = identify_opponent(piece)
        opposing_piece = identify_opposing_piece(team, move)
        opposing_team.eliminate(opposing_piece) if opponent_present?(piece, move)
        piece.update_position(move)
        @board.update_board([@black_team, @white_team])
    end

    def winner?
        result = false
        [@black_team, @white_team].each do |team|
            break if result
            result = team.active_pieces.none? { |piece| piece.class == King }
        end
        result
    end
end