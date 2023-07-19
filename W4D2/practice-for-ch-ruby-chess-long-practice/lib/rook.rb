require_relative 'slideable'
require_relative "piece"

class Rook < Piece
  include Slideable

  def symbol
    color == :white ? '♖' : '♜'
  end

  private

  def move_dirs
    horizontal_dirs
  end
end
