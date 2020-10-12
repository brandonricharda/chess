Dir["*.rb"].each { |file| require_relative file unless file == "game.rb" }
require "json"
require "yaml"
include BoardHelper

class Game
    attr_accessor :board, :black_team, :white_team, :last_move_team
    def initialize
        @board = Board.new
        @save_file = nil
        @black_team = Team.new("black")
        @white_team = Team.new("white")
        @last_move_team = nil
    end

    def play_game
        prompt_load unless Dir["./save/*.yml"].empty?
        push_to_board
        until winner?
            prompt_save if @save_file == nil
            play_round
        end
        p "Game Over!"
    end

    def play_round
        [@black_team, @white_team].each do |team|
            next if @last_move_team == team
            make_move(team)
            save_game(@save_file)
            break if winner?
        end
    end

    def make_move(team)
        @board.display
        piece = select_piece(team)
        move = select_move(piece)
        opposing_team = identify_opponent(piece)
        opposing_piece = get_piece_at_coordinates(move)
        opposing_team.eliminate(opposing_piece) if opponent_present?(piece, move)
        @board.occupancies[piece.position] = nil
        @last_move_team = team
        piece.update_position(move)
        push_to_board
    end

    def winner?
        result = false
        [@black_team, @white_team].each do |team|
            break if result
            result = team.active_pieces.none? { |piece| piece.class == King }
        end
        result
    end

    def push_to_board
        @board.update_board([@black_team, @white_team])
    end

    def prompt_save
        p "Please enter a new filename to save this game."
        file_name = gets.chomp
        save_game(file_name)
        p "New game #{file_name} saved."
    end

    def prompt_load
        p "Would you like to load a file? Type Y or N."
        input = gets.chomp
        if input.upcase == "Y"
            p "Please enter the name of the file you would like to load. Copy/paste from the list below."
            files_in_folder = Dir["./save/*.yml"]
            files_in_folder.each { |file| p file }
            selection = gets.chomp
            until files_in_folder.include?(selection)
                p "Please double-check your selection."
                selection = gets.chomp
            end
            file_name_only = selection.slice(7..-5)
            load_game(file_name_only)
        else
            p "Starting new game."
            return false
        end
    end

    def save_game(file_name)
        save_file = YAML.dump(self)
        File.open("./save/#{file_name}.yml", "w") { |file| file.write save_file }
        @save_file = file_name
    end

    def load_game(file_name)
        save_file = YAML.load_file("./save/#{file_name}.yml")
        @board = save_file.board
        @black_team = save_file.black_team
        @white_team = save_file.white_team
        @save_file = file_name
        @last_move_team = save_file.last_move_team
    end
end