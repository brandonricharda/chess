require_relative "player.rb"

class Pawn < Player
    attr_accessor :symbol, :diagonal_coordinates
    def initialize(position, color)
        super(position, color)
        options = {"white" => "\u2659", "black" => "\u265F"}
        @symbol = options[color]
        @legal_movements = {
            :one_forward    => [0, 1],
            :two_forward    => [0, 2],
            :diagonal_left  => [-1, 1],
            :diagonal_right => [1, 1]
        }
    end

    def potential_moves
        moves = parse_potential_moves(@legal_movements)
        # the board is laid out in black team's perspective
        # moving forward as black pawn means moving to higher value (>) squares
        # moving forward as white pawn means moving to lower value (<) squares
        comp_op = @team == "black" ? ">" : "<"
        moves.select { |coordinates| coordinates[1].public_send(comp_op, @position[1]) }
    end

end