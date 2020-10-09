module BoardHelper
    def select_piece(team)
        team.selector
        team.selected_piece
    end

    def select_move(piece)
        p "Please enter the move you would like to make."
        move = JSON.parse(gets.chomp)
        until validate_move(piece, move)
            p "Please ensure you have entered a valid move. It should be an array with [x, y] coordinates."
            move = JSON.parse(gets.chomp)
        end
        move
    end

    def validate_move(piece, move)
        return false if impossible_move?(piece, move)
        piece.piece == "Pawn" ? legal_pawn_move?(piece, move) : legal_non_pawn_move?(piece, move)
    end

    def legal_non_pawn_move?(piece, move)
        empty_square?(move) || opponent_present?(piece, move)
    end

    def legal_pawn_move?(piece, move)
        diagonal?(piece, move) ? opponent_present?(piece, move) : empty_square?(move)
    end

    def empty_square?(move)
        @board.occupancies[move] == nil
    end

    def opponent_present?(piece, move)
        return false if @board.occupancies[move] == nil
        @board.occupancies[move].team == identify_opponent(piece).color
    end

    def diagonal?(piece, move)
        (move[0] - piece.position[0]).abs == 1
    end

    #I need to look at whether this needs to return an array and what can be done to return the correct value if not
    def identify_opponent(piece)
        piece.team == "black" ? @white_team : @black_team
    end

    def impossible_move?(piece, move)
        !piece.confirm_moves(piece.legal_movements).include?(move)
    end

    def determine_capture(piece, move)
        @board.occupancies[move] == identify_opponent(piece)
    end

    def collect_potential_moves(piece)
        piece.confirm_moves(piece.legal_movements).select { |move| validate_move(piece, move) }
    end

    def get_piece_at_coordinates(coordinates)
        @board.occupancies[coordinates]
    end
end