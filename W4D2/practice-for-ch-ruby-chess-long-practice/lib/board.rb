require "./"

class Board
  attr_reader :grid
  def initialize
    @grid = Array.new(8) {Array.new(8)}

    populate_board

  end

  def move_piece(start_pos, end_pos)
    raise "No piece at start position" if self[start_pos].nil?
    raise "Piece cannot move to end position" unless self[start_pos].valid_moves.include?(end_pos)

    piece = self[start_pos]
    self[start_pos] = nil
    self[end_pos] = piece
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
  def valid_pos?(pos)
    pos.all? { |coord| coord.between?(0, 7) }
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

b = Board.new



