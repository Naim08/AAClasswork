class Piece
  attr_reader :color, :board
  attr_accessor :pos

  def initialize(color, board, pos)
    @color = color
    @board = board
    @pos = pos

    board[pos] = self
  end
  def moves
    # implemented by subclasses
    raise NotImplementedError
  end

  def valid_moves
    moves.reject { |end_pos| move_into_check?(end_pos) }
  end

  def to_s
    " #{symbol} "
  end

  def empty?
    if pos.empty?
      return true
    end
    return false
  end

  def pos=(value)

  end
  private

  def move_into_check?(end_pos)
    duped_board = board.dup
    duped_board.move_piece!(pos, end_pos)
    duped_board.in_check?(color)
  end
end





