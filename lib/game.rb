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

    def make_move(team)
        piece = select_piece(team)
        move = select_move(piece)
        opposing_team = identify_opponent(piece)
        opposing_piece = identify_opposing_piece(team, move)
        opposing_piece.eliminate(opposing_piece) if opponent_present?(piece, move)
        piece.update_position(move)
    end
end

test = Game.new
test.make_move(test.black_team)