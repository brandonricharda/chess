["bishop.rb", "king.rb", "knight.rb", "pawn.rb", "queen.rb", "rook.rb"].each { |file| require_relative file }

class Team
    attr_accessor :color, :positions, :active_pieces, :selected_piece, :eliminated_pieces
    def initialize(color)
        @color = color
        @board_reference = Board.new.vertices.keys
        @positions = starting_positions
        @active_pieces = create_pieces
        @selected_piece = nil
        @eliminated_pieces = []
    end

    def starting_positions
        if @color == "black"
            result = {
                Rook => [[0, 0], [7, 0]],
                Knight => [[1, 0], [6, 0]],
                Bishop => [[2, 0], [5, 0]],
                Queen => [[3, 0]],
                King => [[4, 0]],
                Pawn => @board_reference.select { |coordinates| coordinates[1] == 1 }
            }
        elsif @color == "white"
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

    def create_pieces
        result = []
        @positions.each do |piece, array|
            array.each do |coordinates|
                result << piece.new(coordinates, @color)
            end
        end
        result
    end

    def list_pieces
        result = {}
        @active_pieces.each do |piece|
            result[piece.class] = [] unless result[piece.class]
            result[piece.class] << piece.position
        end
        result.each { |pair| p pair }
    end

    def selector(piece, position)
        result = nil
        @active_pieces.each do |potential|
            break if result
            next if potential.class.to_s.upcase != piece.upcase
            result = potential if potential.position == position
        end
        @selected_piece = result
    end
end