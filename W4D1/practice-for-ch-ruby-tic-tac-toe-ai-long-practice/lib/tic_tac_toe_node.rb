require_relative "tic_tac_toe"

class TicTacToeNode
  attr_reader :board, :next_mover_mark, :prev_move_pos, :children
  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark # :x or :o
    @prev_move_pos = prev_move_pos # [x, y]
    @children = []
  end

  def losing_node?(evaluator)
  end

  def winning_node?(evaluator)
  end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children
    mover_mark = @next_mover_mark == :x ? :o : :x
    (0..2).each do |row|
      (0..2).each do |col|
        pos = [row, col]
        if @board.empty?(pos)
          new_board = @board.dup
          new_board[pos] = mover_mark
          @children << TicTacToeNode.new(new_board, mover_mark, pos)
        end
      end
    end
    @children
  end
end

# board = Board.new
# board[[1,2]] = :x
# tic_tac_toe_node = TicTacToeNode.new(board, :x)

# p tic_tac_toe_node.children
