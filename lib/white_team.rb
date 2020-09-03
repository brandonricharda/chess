Dir["*.rb"].each { |file| require_relative file }

class WhiteTeam
    attr_accessor :pieces
    def initialize
        @board_reference = Board.new.vertices.keys
        @pieces = create_pieces
    end

    def get_positions
        result = {
            Rook => [[0, 7], [7, 7]],
            Knight => [[1, 7], [6, 7]],
            Bishop => [[2, 7], [5, 7]],
            Queen => [[3, 7]],
            King => [[4, 7]],
            Pawn => @board_reference.select { |coordinates| coordinates[1] == 6 }
        }
    end

    def create_pieces
        result = []
        get_positions.each do |piece, positions_array|
            positions_array.each do |coordinates|
                result << piece.new(coordinates, "white")
            end
        end
        result
    end

end