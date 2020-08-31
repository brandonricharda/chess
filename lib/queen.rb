require_relative "all_directions.rb"
require_relative "player.rb"
include All_Directions

class Queen < Player
    attr_accessor :symbol
    def initialize(position, color)
        super(position, color)
        options = {"white" => "\u2655", "black" => "\u265B"}
        @symbol = options[color]
    end

    def potential_moves
        result = []
        All_Directions.instance_methods.each do |method|
            next if method == :vertices
            result << public_send(method, @position)
        end
        result.select { |coordinates| !coordinates.empty? }
    end
end