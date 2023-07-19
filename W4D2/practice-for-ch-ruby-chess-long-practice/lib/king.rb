
require_relative 'stepable'

class King < Piece
  include Stepable

  def symbol
    color == :white ? '♔' : '♚'
  end

  protected

  def move_diffs
    [
      [-1, -1],
      [-1, 0],
      [-1, 1],
      [0, -1],
      [0, 1],
      [1, -1],
      [1, 0],
      [1, 1]
    ]
  end
end