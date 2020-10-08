class Board
    attr_accessor :occupancies, :vertices, :squares
    def initialize
        @teams = ["black", "white"]
        @occupancies = assign_occupancies
        @vertices = @occupancies.keys
        @squares = { 
            :black => "\u25A0", 
            :white => "\u25A1" 
        }
    end

    def display
        final = []
        checkboard = assemble_checkboard
        checkboard.each_slice(8) { |row| p row }
    end

    def assemble_checkboard
        output = []
        @occupancies.each do |coordinates, occupant|
            if occupant
                output << occupant.symbol
            else
                x = coordinates[0]
                y = coordinates[1]
                output << determine_square_color(x, y)
            end
        end
        output
    end

    def assign_occupancies
        vertices = {}
        axis_min = 0
        axis_max = 7
        axis = axis_min.upto(axis_max).to_a
        axis.each do |y|
            axis.each do |x|
                vertices[[x, y]] = nil
            end
        end
        vertices
    end

    def determine_square_color(x, y)
        if odd_number(y)
            odd_number(x) ? @squares[:black] : @squares[:white]
        else
            odd_number(x) ? @squares[:white] : @squares[:black]
        end
    end

    def odd_number(number)
        number % 2 > 0
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