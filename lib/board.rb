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

end