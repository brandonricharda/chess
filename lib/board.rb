class Board
    attr_accessor :vertices
    def initialize
        @teams = ["black", "white"]
        @vertices = get_vertices
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
            team.active_pieces.each { |piece| @vertices[piece.position] = piece }
        end
    end

end