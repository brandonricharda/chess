class Board
    attr_accessor :occupancies, :vertices
    def initialize
        @teams = ["black", "white"]
        @occupancies = get_vertices
        @vertices = @occupancies.keys
    end

    def display
        final = []
        values = assemble_checkboard
    end

    def assemble_checkboard
        output = []
        black_square = "\u25A0"
        white_square = "\u25A1"
        @occupancies.each do |position, occupant|
            if occupant
                output << occupant.symbol
            else
                if output.empty?
                    output << black_square
                else
                    output << (output.last == black_square ? white_square : black_square)
                end
            end
        end
        output
    end

    def get_vertices
        vertices = {}
        axis = 0.upto(7).to_a
        axis.each do |x|
            axis.each do |y|
                vertices[[x, y]] = nil
            end
        end
        vertices
    end

    def opponent_present?(position, team)
        opponent = @teams.select { |option| option != team }
        result = @vertices[position] == opponent ? true : false
    end

    def path_blocked?(piece, desired_spot)
        potential_moves = piece.potential_moves
        in_between = []
        potential_moves.each do |coordinates|
            in_between << coordinates if @vertices[coordinates] != nil
        end
        in_between.length > 0
    end

    def update_board(teams)
        teams.each do |team|
            team.active_pieces.each do |piece|
                @occupancies[piece.position] = piece
            end
        end
    end

end