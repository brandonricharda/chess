Dir["*.rb"].each { |file| require_relative file unless file == "game.rb" }
require "json"
include BoardHelper

class Game
    attr_accessor :board, :black_team, :white_team
    def initialize
        @board = Board.new
        @black_team = Team.new("black")
        @white_team = Team.new("white")
    end

    def play_game
        push_to_board
        until winner?
            play_round
        end
    end

    def play_round
        [@black_team, @white_team].each { |team| make_move(team) }
    end

    def make_move(team)
        @board.display
        piece = select_piece(team)
        move = select_move(piece)
        opposing_team = identify_opponent(piece)
        opposing_piece = identify_opposing_piece(team, move)
        opposing_team.eliminate(opposing_piece) if opponent_present?(piece, move)
        piece.update_position(move)
        push_to_board
    end

    def winner?
        result = false
        [@black_team, @white_team].each do |team|
            break if result
            result = team.active_pieces.none? { |piece| piece.class == King }
        end
        result
    end

    def push_to_board
        @board.update_board([@black_team, @white_team])
    end
end

test = Game.new
test.play_game