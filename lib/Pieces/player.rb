class Player
    attr_accessor :total_moves, :position
    def initialize(position)
        @total_moves = 0
        @position = position
    end

    def legal_moves(current)
        #take the current position and return legal moves from there based on piece's direction instance variable
        result = []
        self.direction.each do |arr|
            result << [arr[0] + current[0], arr[1] + current[1]]
        end
        result
    end

    def move(current, target)
        if legal_moves(current).include?(target)
            #this means the move is legal
            #first need to check, however, whether it is occupied by 
        end
        #check the legal_moves array to see if it contains the target
            #if so, make the move and update the piece's total moves instance variable
            #if not, return an error message
    end
end