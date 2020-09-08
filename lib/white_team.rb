require_relative "team.rb"
require_relative "board.rb"

class WhiteTeam < Team
    attr_accessor :pieces
    def initialize
        @color = "white"
        @pieces = create_pieces(starting_positions, "white")
    end

    def starting_positions
        result = {
            Rook => [[0, 7], [7, 7]],
            Knight => [[1, 7], [6, 7]],
            Bishop => [[2, 7], [5, 7]],
            Queen => [[3, 7]],
            King => [[4, 7]],
            Pawn => @board_reference.select { |coordinates| coordinates[1] == 6 }
        }
    end
end