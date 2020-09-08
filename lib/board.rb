class Board
    attr_accessor :vertices
    def initialize
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

    def opponent_present?(position, opposite_team)
        result = @vertices[position] == opposite_team ? true : false
    end

    def own_present?(position, own_team)
        result = @vertices[position] == own_team ? true : false
    end

end