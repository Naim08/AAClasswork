require_relative "piece.rb"

class Board
  attr_reader :grid
  def initialize
    @grid = Array.new(8) {Array.new(8)}

    populate_board

  end


  def move_piece(color, start_pos, end_pos)
    piece = self[start_pos]
    raise "No piece at start position" if piece.empty?
    raise "Piece does not belong to #{color} player" if piece.color != color
    raise "Piece cannot move to end position" unless piece.valid_moves.include?(end_pos)

    self[end_pos] = piece
    self[start_pos] = nil
    piece.pos = end_pos
  end

  def move_piece!(start_pos, end_pos)
    piece = self[start_pos]
    raise "No piece at start position" if piece.empty?
    raise "Piece does not belong to #{color} player" if piece.color != color


    self[end_pos] = piece
    self[start_pos] = nil
    piece.pos = end_pos
  end

  def [](pos)
    row, col = pos
    @grid[row][col]
  end

  def []=(pos, piece)
    row, col = pos
    @grid[row][col] = piece
  end

  def find_king(color)
    self.grid.flatten.find do |el|
      el.is_a?(King) && el.color == color
    end
  end

  def in_check?(color)
    king_pos = find_king(color).pos
    self.grid.flatten.each do |piece|
      return true if piece.color != color && piece.moves.include?(king_pos)
    end
    false
  end

  # def checkmate?(color)
  #   return false unless in_check?(color)

  #   pieces = self.grid.flatten.select { |piece| piece && piece.color == color }
  #   pieces.all? { |piece| piece.valid_moves.empty? }
  # end

  def dup
    dup_board = Board.new
    self.grid.each_with_index do |row, i|
      row.each_with_index do |col, j|
        dup_board.add_piece(self[[i, j]].dup, [i, j]) if self[[i, j]]
      end
    end
    dup_board
  end

  def add_piece(piece, pos)
    self[pos] = piece
  end

  private

  def populate_board
    # populate back row
    back_row = [Rook, Knight, Bishop, King, Queen, Bishop, Knight, Rook]
    back_row.each_with_index do |piece_class, col|
      piece_class.new(:black, self, [0, col])
    end

    # populate pawns
    (0..7).each do |col|
      Pawn.new(:black, self, [1, col])
      Pawn.new(:white, self, [6, col])
    end

    # populate front row
    front_row = [Rook, Knight, Bishop, King, Queen, Bishop, Knight, Rook]
    front_row.each_with_index do |piece_class, col|
      piece_class.new(:white, self, [7, col])
    end
  end
end
