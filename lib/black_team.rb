require_relative "team.rb"
require_relative "board.rb"

class BlackTeam < Team
    attr_accessor :pieces, :pieces
    def initialize
        @pieces = create_pieces(starting_positions, "black")
    end

    def starting_positions
        result = {
            Rook => [[0, 0], [7, 0]],
            Knight => [[1, 0], [6, 0]],
            Bishop => [[2, 0], [5, 0]],
            Queen => [[3, 0]],
            King => [[4, 0]],
            Pawn => @board_reference.select { |coordinates| coordinates[1] == 1 }
        }
    end
end