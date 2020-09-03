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
end