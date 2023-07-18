class King < Piece
  def symbol
    "👑"
 end

  def moves
    moves = []
    cur_x, cur_y = pos

    move_diffs.each do |(dx, dy)|
      new_x = cur_x + dx
      new_y = cur_y + dy
      new_pos = [new_x, new_y]

      next unless board.valid_pos?(new_pos)

      if board[new_pos].empty?
        moves << new_pos
      else
        moves << new_pos if board[new_pos].color != color
      end
    end

    moves
  end

  private

  def move_diffs
    [[-1, -1], [-1, 0], [-1, 1], [0, -1], [0, 1], [1, -1], [1, 0], [1, 1]]
  end
end
