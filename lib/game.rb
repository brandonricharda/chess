Dir["*.rb"].each { |file| require_relative file }

class Game
    attr_accessor :board
    def initialize
        @board = Board.new
    end
end