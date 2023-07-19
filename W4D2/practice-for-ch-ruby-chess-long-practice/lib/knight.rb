require_relative "Stepable"
require_relative "piece"

class Knight < Piece
  include Stepable

  def initialize(color, board, pos)
    super
  end 

  def symbol
    color == :white ? '♘' : '♞'
  end

  protected

  def move_diffs
    [
      [-2, -1],
      [-2, 1],
      [-1, -2],
      [-1, 2],
      [1, -2],
      [1, 2],
      [2, -1],
      [2, 1]
    ]
  end
end
