class Team
    def initialize
        @pieces = create_pieces
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
            next if potential.class.to_s != piece
            result = potential if potential.position == position
        end
        result
    end
end