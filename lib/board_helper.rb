module BoardHelper
    def select_piece(team)
        team.selector
        team.selected_piece
    end

    def select_move(piece)
        p "Please enter the move you would like to make."
        move = nil
        until validate_move(piece, move)
            p "Make sure you enter a valid move in [x, y] coordinates form to represent where you want the piece to land."
            input = ensure_array_input
            move = JSON.parse(input[:result])
        end
        move
    end

    def ensure_array_input
        input = prompt_array_input
        until is_array?(input)
            p "Please make sure you enter an array to represent [x, y] coordinates."
            input = prompt_array_input
        end
        input
    end

    def prompt_array_input
        input = gets.chomp
        first_char = input[0]
        last_char = input[-1]
        { :result => input, :first_char => first_char, :last_char => last_char }
    end

    def is_array?(input)
        input[:first_char] == "[" && input[:last_char] == "]"
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