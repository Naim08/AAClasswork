class Pawn < Pieces
 def symbol
   "♙"
 end

 def moves
  side_attack + forward_steps
 end

private
 def at_start_row?
   if @color == :black && pos[0] == 1
    return true
   end

   if @color == :white && pos[0] == 6
    return true
   end
   return false
 end

 def forward_dir
   @color == :black ? 1 : -1
 end

 def forward_steps
  x, y = @pos
  val = forward__dir
  result = []

  result << [x,y+(1*val)] if y+(1*val).between?(0,7)

   if at_start_row?
     result << [x,y+(2*val)]
   end

   result

 end

 def side_attack
   val = forward_dir
   result = []
   result << [x+1,y+(1*val)] if y+(1*val).between?(0,7) && x+1.between?(0,7)
   result << [x-1,y+(1*val)] if y+(1*val).between?(0,7) && x-1.between?(0,7)
   result.select do |new_pos|
    next false unless board.valid_pos?(new_pos)
    next false if board[new_pos].empty?

    threatened_piece = board[new_pos]
    threatened_piece.color != color
  end
 end

end
