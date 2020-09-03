Dir["*.rb"].each { |file| require_relative file }

class BlackTeam > Team
    attr_accessor :starting_positions, :board_reference
    def initialize
        @board_reference = Board.new.vertices.keys
        @pieces = create_pieces
    end

    def get_positions
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