require "byebug"
# def my_min(arr)

#     arr.each do |ele_1|
#         return ele_1 if arr.all? { |ele_2| ele_1 <= ele_2 }
#     end


# end
#
def my_min(arr)
  min = arr[0]
  arr.each do |ele|
    if ele < min
      min = ele
    end
  end
  return min
end

#p my_min([0,3,5,4, -5, 10, 1, 90])

# def sub_sum(arr)
#   subs = []
#   i, j = 0, 0
#   while i < arr.length - 1
#     j = i
#     while  j < arr.length
#       subs << arr[i..j]
#       j += 1
#     end
#     i += 1
#   end


# largest = subs[0].sum
#   subs.each do |sub|
#    sum = sub.sum
#    if largest < sum
#      largest = sum
#    end
#   end
# return largest
# end
#

def sub_sum(arr)
  max_sum = arr[0]
  curr_sum = 0
    arr.each do |ele|
      curr_sum += ele
      if curr_sum > max_sum
        max_sum = curr_sum
      end

      p curr_sum
      if curr_sum < 0
        curr_sum = 0
      end
    end
    max_sum
end


p sub_sum([2, 3, -6, 7, -6, 7,-9,10])



