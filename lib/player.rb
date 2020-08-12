class Player
    attr_accessor :position
    def initialize(position)
        @position = position
    end

    def legal_moves(current)
        result = []

        #see if self.direction has any moves with 'notes' ("must be first move" or "opponent must be present")
            #if so, evaluate that statement and do not push it to result
            #if the statement is true, push the move, sans 'note,' to result

        self.direction.each do |arr|
            next if arr.include?("must be first move") && self.total_moves > 0
            #I need something that evaluates "opponent must be present"
            result << arr.select { |value| value.class == Integer }
        end

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