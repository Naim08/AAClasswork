class Array
  def my_uniq
    self.uniq
  end

  # find pairs that add up to zero
  def two_sum
    result = []
    self.each_with_index do |el1, idx1|
      self.each_with_index do |el2, idx2|
        if idx2 > idx1 && el1 + el2 == 0
          result << [idx1, idx2]
        end
      end
    end
    result
  end

  def my_transpose
    result = []
    self.each_with_index do |row, idx1|
      row.each_with_index do |col, idx2|
        result << [idx1, idx2]
      end
    end
    result
  end
end

p [1, 2, 1, 3, 3].my_uniq
p [-1, 0, 2, -2, 1].two_sum

def stock_picker(prices)
  result = []
  prices.each_with_index do |price1, idx1|
    prices.each_with_index do |price2, idx2|
      if idx2 > idx1
        result << [idx1, idx2]
      end
    end
  end
  result
end

# print towers_of_hanoi arrays in a pretty way (maybe use recursion?)
def display(arr_1, arr_2, arr_3)
  puts "Tower 1"
  arr_1.each_with_index do |index|
    puts "-" * (index * 2 + 1)
  end
  puts "Tower 2"
  arr_2.each_with_index do |index|
    puts "-" * (index * 2 + 1)
  end
  puts "Tower 3"
  arr_3.each_with_index do |index|
    puts "-" * (index * 2 + 1)
  end
end

def towers_of_hanoi
  # create 3 arrays
  # ask user for input to set tower height
  # set first array to tower height
  # set second and third arrays to empty
  # until second or third array is equal to tower height
  #  ask user for input
  #  get input
  #  if input is 1
  #  move top disk from first array to second array
  #  if input is 2
  #  move top disk from first array to third array
  #  if input is 3
  #  move top disk from second array to third array
  #  if input is 4
  #  move top disk from third array to second array
  #  if input is 5
  #  move top disk from second array to first array
  #  if input is 6
  #  move top disk from third array to first array
  #  if input is 7
  #  print "Goodbye!"
  height_input = gets.chomp.to_i

  first_array = (1..height_input).to_a
  second_array = []
  third_array = []

  puts "Please enter a number from 1 to 7"
  puts "1: Move top disk from first array to second array"
  puts "2: Move top disk from first array to third array"
  puts "3: Move top disk from second array to third array"
  puts "4: Move top disk from third array to second array"
  puts "5: Move top disk from second array to first array"
  puts "6: Move top disk from third array to first array"
  puts "7: Quit"

  until second_array == first_array || third_array == first_array
    display(first_array, second_array, third_array)
    print first_array, second_array, third_array
    input = gets.chomp.to_i
    if input == 1
      second_array << first_array.shift
    elsif input == 2
      third_array << first_array.shift
    elsif input == 3
      third_array << second_array.shift
    elsif input == 4
      second_array << third_array.shift
    elsif input == 5
      first_array << second_array.shift
    elsif input == 6
      first_array << third_array.shift
    elsif input == 7
      puts "Goodbye!"
      break
    else
      puts "Please enter a number from 1 to 7"
    end
  end
  puts "You win!"
end

towers_of_hanoi
