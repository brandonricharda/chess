require_relative "player.rb"
require_relative "board.rb"

class Pawn < Player
    attr_accessor :symbol, :diagonal_coordinates
    def initialize(position, color)
        super(position, color)
        options = {"white" => "\u2659", "black" => "\u265F"}
        @symbol = options[color]
    end

    def potential_moves
        result = []
        vertices = Board.new.vertices
        # hash detailing squares traversed in each move
        # traversal described for each axis [x, y]
        squares_moved = {
            :one_forward    => [0, 1],
            :two_forward    => [0, 2],
            :diagonal_left  => [-1, 1],
            :diagonal_right => [1, 1]
        }
        # compares each vertex on the board to the current position
        # adds vertex to result array if a match exists in squares_moved
        vertices.each do |coordinates|
            comparison = []
            comparison << (coordinates[0] - @position[0]).abs
            comparison << (coordinates[1] - @position[1]).abs
            result << coordinates if squares_moved.values.include?(comparison)
        end
        # the board is laid out in black team's perspective
        # moving forward as black pawn means moving to higher value (>) squares
        # moving forward as white pawn means moving to lower value (<) squares
        comp_op = @team == "black" ? ">" : "<"
        # selects legal moves based on y axis comparison using assigned operator
        result.select { |coordinates| coordinates[1].public_send(comp_op, @position[1]) }
    end

end