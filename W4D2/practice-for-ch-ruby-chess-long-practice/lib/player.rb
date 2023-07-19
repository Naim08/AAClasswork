require_relative "display.rb"

class Player 

    def initialize(color, display)
    @color = color 
    @display = display 
    end 

    def make_move
       raise NotImplementedError
    end 

end 