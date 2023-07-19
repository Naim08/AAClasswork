require_relative 'Stepable'
require_relative "piece"

class King < Piece
  include Stepable

  def initialize(color, board, pos)
    super
  end 

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
