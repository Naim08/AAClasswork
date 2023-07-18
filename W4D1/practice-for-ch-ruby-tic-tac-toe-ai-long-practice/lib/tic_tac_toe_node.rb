require_relative "tic_tac_toe"

class TicTacToeNode
  attr_reader :board, :next_mover_mark, :prev_move_pos
  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark # :x or :o
    @prev_move_pos = prev_move_pos # [x, y]
  end

  def losing_node?(evaluator)
    if @board.over?

     return board.won? && board.winner != evaluator

    end

    if self.next_mover_mark == evaluator
      self.children.all? {|child| child.losing_node?(evaluator)}
    else
      self.children.any? {|child| child.losing_node?(evaluator)}
    end
  end

  def winning_node?(evaluator)
    if @board.over?
      return true if @board.winner == evaluator
      return false if @board.winner == nil || @board.winner != evaluator
    end

    if @next_mover_mark == evaluator
      children.any? {|child| child.winning_node?(evaluator)}
    else
      children.all? {|child| child.winning_node?(evaluator)}
    end

  end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children
    child_arr = []
    mover_mark = @next_mover_mark == :x ? :o : :x
    (0..2).each do |row|
      (0..2).each do |col|
        pos = [row, col]
        if @board.empty?(pos)
          new_board = @board.dup
          new_board[pos] = @next_mover_mark
          child_arr << TicTacToeNode.new(new_board, mover_mark, pos)
        end
      end
    end
    child_arr
  end

end

# board = Board.new
# board[[1,2]] = :x
# tic_tac_toe_node = TicTacToeNode.new(board, :x)

# p tic_tac_toe_node.children
