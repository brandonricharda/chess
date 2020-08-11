class Board

    attr_accessor :board

    def initialize
        @board = get_vertices
    end

    def get_vertices
        vertices = []
        axis = 0.upto(7).to_a
        axis.each do |x|
            axis.each do |y|
                vertices << [x, y]
            end
        end
        vertices
    end

    def display
        row = []
        @board.each do |vertex|
            if row.length == 8
                p row
                row = []
            end
            row << "*" if vertex.length == 2
        end
    end

end