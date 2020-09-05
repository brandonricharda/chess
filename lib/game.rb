Dir["*.rb"].each { |file| require_relative file unless file == "game.rb" }
require "json"

class Game
    attr_accessor :board
    def initialize
        @board = Board.new
        @black_team = BlackTeam.new
        @white_team = WhiteTeam.new
    end

    #prompts the player to select a piece, then returns that piece (nil if piece doesn't exist)
    def player_select(team)
        team.list_pieces
        p "Please select which piece you want to move. Just the name of the piece for now (i.e. pawn)."
        piece = gets.chomp
        p "What position is the piece you want to move?"
        position = JSON.parse(gets.chomp)
        team.selector(piece, position)
    end

end