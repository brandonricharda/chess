Dir["*.rb"].each { |file| require_relative file unless file == "game.rb" }
require "json"

class Game
    attr_accessor :board
    def initialize
        @board = Board.new
        @black_team = Team.new("black")
        @white_team = Team.new("white")
    end

    def player_select(team)
        team.list_pieces
        p "Please select which piece you want to move. Just the name of the piece for now (i.e. pawn)."
        piece = gets.chomp
        p "What position is the piece you want to move?"
        position = JSON.parse(gets.chomp)
        team.selector(piece, position)
    end

end