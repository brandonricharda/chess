require_relative "board.rb"

module All_Directions

    def vertices
        Board.new.vertices.keys
    end

    def top(arr)
        vertices.select { |coordinates| coordinates[0] == arr[0] && coordinates[1] > arr[1] }
    end

    def bottom(arr)
        vertices.select { |coordinates| coordinates[0] == arr[0] && coordinates[1] < arr[1] }
    end

    def left(arr)
        vertices.select { |coordinates| coordinates[0] < arr[0] && coordinates[1] == arr[1] }
    end

    def right(arr)
        vertices.select { |coordinates| coordinates[0] > arr[0] && coordinates[1] == arr[1] }
    end

    def top_right(arr, result = [])
        return result if arr[0] == 7 || arr[1] == 7
        square_above = top(arr).first
        diagonal = right(square_above).first
        result << diagonal
        top_right(diagonal, result)
    end

    def top_left(arr, result = [])
        return result if arr[0] == 0 || arr[1] == 7
        square_above = top(arr).first
        diagonal = left(square_above).last
        result << diagonal
        top_left(diagonal, result)
    end

    def bottom_right(arr, result = [])
        return result if arr[0] == 7 || arr[1] == 0
        square_below = bottom(arr).last
        diagonal = right(square_below).first
        result << diagonal
        bottom_right(diagonal, result)
    end

    def bottom_left(arr, result = [])
        return result if arr[0] == 0 || arr[1] == 0
        square_below = bottom(arr).last
        diagonal = left(square_below).last
        result << diagonal
        bottom_left(diagonal, result)
    end

end