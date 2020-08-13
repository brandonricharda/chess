require_relative "board.rb"

class Player
    attr_accessor :position, :board_reference
    def initialize(position)
        @position = position
        #once we have the team set up properly, this variable will init to nil
        #it will be updated after each move using the update_reference method
        @board_reference = Board.new
    end

    def legal_moves(current)
        result = []
        self.direction.each do |arr|
            integers_only = arr.select { |value| value.class == Integer }
            proposed_coordinates = [current[0] + integers_only[0], current[1] + integers_only[1]]
            #skips if the proposed coordinate has a negative axis or one great than 7, which is off the board
            next if proposed_coordinates.any? { |axis| axis < 0 || axis > 7 }
            #excludes the pawn's first move coordinates if it is not its first move
            next if arr.include?("must be first move") && self.total_moves > 0
            #excludes the pawn's diagonal move if a piece is not present there
            next if arr.include?("opponent must be present") && @board_reference.board.include?(proposed_coordinates)
            #need to add a statement that excludes the diagonal move if it is among the player's team moves (self.team)
            result << proposed_coordinates
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

    def update_reference(board)
        @board_reference = board
    end

end