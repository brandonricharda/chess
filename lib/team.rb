["bishop.rb", "king.rb", "knight.rb", "pawn.rb", "queen.rb", "rook.rb"].each { |file| require_relative file }
require "json"

class Team
    attr_accessor :color, :positions, :active_pieces, :selected_piece, :eliminated_pieces
    def initialize(color)
        @color = color
        @board_reference = Board.new.vertices
        @positions = starting_positions
        @active_pieces = create_pieces
        @selected_piece = nil
        @eliminated_pieces = []
        @messages = {
            "select_piece"     => "Please select which piece you want to move. Just the name of the piece for now (i.e. Pawn).",
            "invalid_piece"    => "Please choose a valid piece that is still within your active pieces.",
            "select_position"  => "What position is the piece you would like to move? Available:",
            "invalid_position" => "Please enter valid coordinates in [x, y] format."
        }
    end

    def starting_positions
        if @color == "black"
            result = {
                Rook   => [[0, 0], [7, 0]],
                Knight => [[1, 0], [6, 0]],
                Bishop => [[2, 0], [5, 0]],
                Queen  => [[3, 0]],
                King   => [[4, 0]],
                Pawn   => @board_reference.select { |coordinates| coordinates[1] == 1 }
            }
        elsif @color == "white"
            result = {
                Rook   => [[0, 7], [7, 7]],
                Knight => [[1, 7], [6, 7]],
                Bishop => [[2, 7], [5, 7]],
                Queen  => [[3, 7]],
                King   => [[4, 7]],
                Pawn   => @board_reference.select { |coordinates| coordinates[1] == 6 }
            }
        end
    end

    def create_pieces
        result = []
        @positions.each do |piece, array|
            array.each do |coordinates|
                result << piece.new(coordinates, @color)
            end
        end
        result
    end

    def list_pieces
        result = {}
        @active_pieces.each do |piece|
            result[piece.class] = [] unless result[piece.class]
            result[piece.class] << piece.position
        end
        result.each { |pair| p pair }
    end

    def collect_positions(piece_name)
        arr = []
        @active_pieces.each { |piece| arr << piece.position if piece.piece.upcase == piece_name }
        arr
    end

    def select_piece
        p @messages["select_piece"]
        piece_name = gets.chomp.upcase
        until @active_pieces.any? { |piece| piece.class.to_s.upcase == piece_name }
            p @messages["invalid_piece"]
            list_pieces
            piece_name = gets.chomp.upcase
        end
        piece_name
    end

    def select_position(piece_name)
        available = collect_positions(piece_name)
        return available[0] if available.length == 1
        p @messages["select_position"] + available.to_s
        location = JSON.parse(gets.chomp)
        until available.include?(location)
            p @messages["invalid_position"]
            location = JSON.parse(gets.chomp)
        end
        location
    end

    def find_piece(piece_name, position)
        @active_pieces.select { |piece| piece.piece.upcase == piece_name && piece.position == position }.first
    end

    def selector
        piece_name      = select_piece
        position        = select_position(piece_name)
        @selected_piece = find_piece(piece_name, position)
    end

    def eliminate(piece)
        position = piece.position
        @eliminated_pieces << piece
        @active_pieces.delete(piece)
        @positions[piece.class].delete(position)
    end

end