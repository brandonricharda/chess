module BoardHelper
    def select_piece(team)
        team.selector
        team.selected_piece
    end

    def select_move(piece)
        p @messages["enter_move"]
        move = JSON.parse(gets.chomp)
        until validate_move(piece, move)
            p @messages["invalid_move"]
            move = JSON.parse(gets.chomp)
        end
        [piece, move]
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
        @board.occupancies[move] == identify_opponent(piece)
    end

    def diagonal?(piece, move)
        (move[0] - piece.position[0]).abs == 1
    end

    def identify_opponent(piece)
        [@black_team, @white_team].select { |team| team.color != piece.team }
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

    def identify_opposing_piece(team, move)
        @board.occupancies[move]
    end
end