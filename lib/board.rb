class Board

    attr_accessor :board

    def initialize
        @board = get_vertices
    end

    def get_vertices
        vertices = {}
        axis = 0.upto(7).to_a
        axis.each do |x|
            vertices[x] = []
            axis.each do |y|
                vertices[x] << [x, y]
            end
        end
        vertices
    end

end