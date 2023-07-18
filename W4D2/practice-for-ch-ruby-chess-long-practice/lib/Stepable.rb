module Stepable
  def moves
    moves = []
    move_diffs.each do |(dx, dy)|
      cur_x, cur_y = pos
      new_pos = [cur_x + dx, cur_y + dy]

      next unless board.valid_pos?(new_pos)

      if board[new_pos].empty?
        moves << new_pos
      elsif board[new_pos].color != color
        moves << new_pos
      end
    end
    moves
  end
end
