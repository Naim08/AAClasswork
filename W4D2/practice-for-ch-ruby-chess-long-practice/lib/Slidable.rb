module Slideable
  HORIZONTAL_DIRS = [[0, -1], [0, 1], [-1, 0], [1, 0]]
  DIAGONAL_DIRS = [[-1, -1], [-1, 1], [1, -1], [1, 1]]

  def diagonal_dirs
    DIAGONAL_DIRS
  end

  def horizontal_dirs
    HORIZONTAL_DIRS
  end

  def moves
    moves = []
    move_dirs.each do |(dx, dy)|
      moves += grow_unblocked_moves_in_dir(dx, dy)
    end
    moves
  end

  private

  def move_dirs
    # implemented by subclass
    raise NotImplementedError
  end

  def grow_unblocked_moves_in_dir(dx, dy)
    cur_x, cur_y = pos
    moves = []

    loop do
      new_pos = [cur_x + dx, cur_y + dy]

      break unless board.valid_pos?(new_pos)

      if board[new_pos].is_a?(NullPiece) 
        moves << new_pos
      else
        moves << new_pos if board[new_pos].color != color
        break
      end

      cur_x, cur_y = new_pos
    end

    moves
  end
end
