require_relative "bishop.rb"
require_relative "board.rb"
require_relative "king.rb"
require_relative "knight.rb"
require_relative "null_piece.rb"
require_relative "pawn.rb"
require_relative "piece.rb"
require_relative "queen.rb"
require_relative "rook.rb"
require_relative "rook.rb"
require_relative "slidable.rb"
require_relative "stepable.rb"

class Piece
  attr_reader :color, :board
  attr_accessor :pos

  def initialize(color, board, pos)
    @color = color
    @board = board
    @pos = pos

    board.add_piece(self, pos)
  end

  def to_s
    " #{symbol} "
  end

  def empty?
    board[pos].is_a?(NullPiece)
  end

  def valid_moves
    moves.reject { |end_pos| move_into_check?(end_pos) }
  end

  def move_into_check?(end_pos)
    test_board = board.dup
    test_board.move_piece!(pos, end_pos)
    test_board.in_check?(color)
  end
end
