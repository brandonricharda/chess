Dir["*.rb"].each { |file| require_relative file unless file == "game.rb" }
require "json"

class Game
    attr_accessor :board
    def initialize
        @board = Board.new
        @black_team = Team.new("black")
        @white_team = Team.new("white")
    end

    def player_select(team)
        team.list_pieces
        p "Please select which piece you want to move. Just the name of the piece for now (i.e. pawn)."
        piece = gets.chomp
        p "What position is the piece you want to move?"
        position = JSON.parse(gets.chomp)
        team.selector(piece, position)
    end

    def validate_move(piece, move)
        #if piece is Pawn, we need to check two things
        if piece.class == Pawn
            #if the move is diagonal...
            if piece.diagonal_coordinates.include?(move)
                #...an opponent must be present
                result = piece.diagonal_coordinates.any? { |coordinates| @board.opponent_present?(coordinates, piece.team) }
            else
                #otherwise, the move is legal as long as the spot is empty and among the potential_moves
                result = @board.vertices[move] == nil && piece.potential_moves.include?(move)
            end
        else
            #add rules for other pieces here
            #we need special consideration to stop pieces from illegally moving past other pieces (i.e. knight jumping over a piece in front of it)
            #this could go in the Board class, akin to the opponent_present? method
        end
        result
    end

end