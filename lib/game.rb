Dir["*.rb"].each { |file| require_relative file unless file == "game.rb" }

class Game
    attr_accessor :board
    def initialize
        @board = Board.new
        @black_team = BlackTeam.new
        @white_team = WhiteTeam.new
    end

    def player_select(piece, position)
        @black_team.list_pieces
        @black_team.selector(piece, position)
        if @black_team.selected_piece.class == Pawn
            p "gotcha"
        end
    end
end