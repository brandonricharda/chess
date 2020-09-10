require_relative "all_directions.rb"
require_relative "player.rb"
include All_Directions

class Pawn < Player
    attr_accessor :symbol, :diagonal_coordinates
    def initialize(position, color)
        super(position, color)
        options = {"white" => "\u2659", "black" => "\u265F"}
        @symbol = options[color]
    end

    def potential_moves
        result = []
        if @team == "black"
            result << top(@position).first
            result << top(@position).second unless @total_moves > 0
            result << top_left(@position).first
            result << top_right(@position).first
        elsif @team == "white"
            result << bottom(@position).last
            result << bottom(@position)[-2] unless @total_moves > 0
            result << bottom_left(@position).first
            result << bottom_right(@position).first
        end
        result.select { |coordinates| coordinates }
    end

    def diagonal_coordinates
        potential_moves.last(2).select { |coordinates| coordinates[0] != @position[0] }
    end

end