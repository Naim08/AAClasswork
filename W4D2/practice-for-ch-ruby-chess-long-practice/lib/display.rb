require 'colorize'
require_relative 'cursor'

class Display
  attr_reader :board, :cursor

  def initialize(board)
    @board = board
    @cursor = Cursor.new([0, 0], board)
  end

  def render
    system("clear")
    puts "  #{(0..7).to_a.join(" ")}"
    board.grid.each_with_index do |row, i|
      print "#{i} "
      row.each_with_index do |piece, j|
        if [i, j] == cursor.cursor_pos
          print piece.to_s.colorize(:background => :light_green)
        elsif (i + j).odd?
          print piece.to_s.colorize(:background => :light_black)
        else
          print piece.to_s.colorize(:background => :light_white)
        end
        print " "
      end
      puts
    end
  end

  def loop_render
    loop do
      render
      cursor.get_input
    end
  end
end
