Dir["*.rb"].each { |file| require_relative file }

class Team
    attr_accessor :pawns
    def initialize(color)
        @starting_positions = {
            #need to store starting positions for each piece
            #also need to come up with a way to avoid duplicating for the two teams
        }
    end
end