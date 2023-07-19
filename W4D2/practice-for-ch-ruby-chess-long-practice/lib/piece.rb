
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
  def pos=(value)
    @pos = value
  end
  def moves
    # implemented by subclasses
    []
  end

  def valid_moves
    moves.reject { |end_pos| move_into_check?(end_pos) }
  end

  def symbol
    # implemented by subclasses
    ""
  end

  private

  def move_into_check?(end_pos)
    duped_board = board.dup
    duped_board.move_piece!(pos, end_pos)
    duped_board.in_check?(color)
  end
end
