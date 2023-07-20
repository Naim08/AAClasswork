require_relative 'board'
require_relative 'human_player'

class Game
  attr_reader :board, :display, :players, :current_player

  def initialize
    @board = Board.new
    @display = Display.new(@board)
    @players = {
      white: HumanPlayer.new(:white, @display),
      black: HumanPlayer.new(:black, @display)
    }
    @current_player = :white
  end

  def play
    until board.checkmate?(current_player)
      begin
        start_pos, end_pos = players[current_player].make_move(board)
        board.move_piece(current_player, start_pos, end_pos)
        swap_turns!
        notify_players
      rescue StandardError => e
        puts e.message
        retry
      end
    end

    display.render
    puts "#{current_player.capitalize} is checkmated."
  end

  private

  def notify_players
    if board.in_check?(current_player)
      puts "#{current_player.capitalize} is in check."
    end
  end

  def swap_turns!
    @current_player = current_player == :white ? :black : :white
  end
end

Game.new.play
