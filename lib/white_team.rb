Dir["*.rb"].each { |file| require_relative file }

class BlackTeam
    attr_accessor :starting_positions, :board_reference
    def initialize
        @board_reference = Board.new.vertices.keys
        @starting_positions = {
            "rooks" => [[0, 7], [7, 7]],
            "knights" => [[1, 7], [6, 7]],
            "bishops" => [[2, 7], [5, 7]],
            "queen" => [[3, 7]],
            "king" => [[4, 7]],
            "pawns" => @board_reference.select { |coordinates| coordinates[1] == 6 }
        }
    end
end