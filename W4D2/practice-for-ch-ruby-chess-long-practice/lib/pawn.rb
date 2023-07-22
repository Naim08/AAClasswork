require_relative "piece"

class Pawn < Piece

  def initialize(color, board, pos)
    super
  end
  def symbol
    color == :white ? "♙" : "♟"
  end

 def moves
  forward_steps + side_attacks
  end

  private

  def at_start_row?
    (color == :black && pos[0] == 1) || (color == :white && pos[0] == 6)
  end

  def forward_dir
    color == :black ? 1 : -1
  end

  def forward_steps
    x, y = pos
    one_step = [x + forward_dir, y]
    return [] unless board.valid_pos?(one_step) && board[one_step].empty?

    steps = [one_step]
    two_step = [x + 2 * forward_dir, y]
    steps << two_step if at_start_row? && board[two_step].empty?
    steps
  end

  def side_attacks
    x, y = pos
    side_moves = [[x + forward_dir, y - 1], [x + forward_dir, y + 1]]

    side_moves.select do |new_pos|
      next false unless board.valid_pos?(new_pos)
      next false if board[new_pos].empty?

      threatened_piece = board[new_pos]
      threatened_piece.color != color
    end
  end
end
