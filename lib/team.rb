class Team
    attr_accessor :pieces, :selected_piece
    def initialize
        @pieces = create_pieces
        @selected_piece = nil
        @eliminated_pieces = []
        @board_reference = Board.new.vertices.keys
    end

    def create_pieces(starting_positions, color)
        result = []
        starting_positions.each do |piece, array|
            array.each do |coordinates|
                result << piece.new(coordinates, color)
            end
        end
        result
    end

    def list_pieces
        result = {}
        @pieces.each do |piece|
            result[piece.class] = [] unless result[piece.class]
            result[piece.class] << piece.position
        end
        result.each { |pair| p pair }
    end

    def selector(piece, position)
        result = nil
        @pieces.each do |potential|
            break if result
            next if potential.class.to_s.upcase != piece.upcase
            result = potential if potential.position == position
        end
        @selected_piece = result
    end
end