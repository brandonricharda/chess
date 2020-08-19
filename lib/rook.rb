require_relative "player.rb"

class Rook < Player
    attr_accessor :symbol, :direction
    def initialize(position, color)
        super(position, color)
        options = {"white" => "\u2656", "black" => "\u265C"}
        @symbol = options[color]
    end

    def potential_moves
        result = []
        x = @position[0]
        y = @position[1]

        if @team == "black"
            #assigns potential moves in a cross formation focused on the current spot
            0.upto(7).each { |x| result << [x, y] unless [x, y] == @position }
            0.upto(7).each { |y| result << [x, y] unless [x, y] == @position }
        elsif @team == "white"
            #assigns potential moves for the white team, which sits at the other end of the board
            7.downto(0).each { |x| result << [x, y] unless [x, y] == @position }
            7.downto(0).each { |y| result << [x, y] unless [x, y] == @position }
        end

        result

    end

end