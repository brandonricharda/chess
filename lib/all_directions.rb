require_relative "board.rb"

module All_Directions

end

#working on methods that will create adjacency lists in each direction
#I'll add it to the module once complete

@vertices = Board.new.vertices.keys

def top(x, y)
    @vertices.select { |coordinates| coordinates[0] == x && coordinates[1] > y }
end

def bottom(x, y)
    @vertices.select { |coordinates| coordinates[0] == x && coordinates[1] < y }
end

def left(x, y)
    @vertices.select { |coordinates| coordinates[0] < x && coordinates[1] == y }
end

def right(x, y)
    @vertices.select { |coordinates| coordinates[0] > x && coordinates[1] == y }
end