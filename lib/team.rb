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

    #I need a method that lists all of a team's pieces currently on the board

end