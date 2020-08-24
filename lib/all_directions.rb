module All_Directions

    def diagonal(x, y, position)
        result = []

        until x == 0 || y == 0
            x -= 1
            y -= 1
        end

        until x > 7 || y > 7
            result << [x, y] unless [x, y] == position
            x += 1
            y += 1
        end

        result

    end

    def linear(x, y, position, team)
        result = []

        if team == "black"
            #assigns potential moves in a cross formation focused on the current spot
            0.upto(7).each { |x| result << [x, y] unless [x, y] == position }
            0.upto(7).each { |y| result << [x, y] unless [x, y] == position }
        elsif team == "white"
            #assigns potential moves for the white team, which sits at the other end of the board
            7.downto(0).each { |x| result << [x, y] unless [x, y] == position }
            7.downto(0).each { |y| result << [x, y] unless [x, y] == position }
        end

        result

    end

end