Dir["*.rb"].each { |file| require_relative file }

class BlackTeam
    attr_accessor :starting_positions, :board_reference
    def initialize
        @board_reference = Board.new.vertices.keys
        @starting_positions = {
            "rooks" => [[0, 0], [7, 0]],
            "knights" => [[1, 0], [6, 0]],
            "bishops" => [[2, 0], [5, 0]],
            "queen" => [[3, 0]],
            "king" => [[4, 0]],
            "pawns" => @board_reference.select { |coordinates| coordinates[1] == 1 }
        }
    end
end