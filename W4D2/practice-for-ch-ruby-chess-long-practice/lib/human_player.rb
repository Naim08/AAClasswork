require_relative "player.rb"
require_relative 'display'

class HumanPlayer < Player
    attr_reader :color, :display

    def make_move(_board)
        start_pos = nil
        end_pos = nil

        until start_pos && end_pos
            display.render
            if start_pos
            puts "Move to where?"
            end_pos = display.cursor.get_input
            else
            puts "#{color.capitalize}, select a piece to move."
            start_pos = display.cursor.get_input
            end
        end

        [start_pos, end_pos]
    end
end

