# def permutation(str_1)
#     return [str_1] if str_1.length <= 1


#     first = str_1[0]
#     result = permutation(str_1[1..-1])


#     p result
#     all_permutations = []


#     result.each do |ele|
#       p ele

#         (0..ele.length).each do |i|
#           p i
#           all_permutations << ele[0...i] + first + ele[i..-1]
#         end
#     end


#     all_permutations

# end

def first_anagram?(str_1, str_2)
  return false if str_1.length != str_2.length
  letters = str_1.split("")
  anagrams = letters.permutation(letters.length).to_a

  anagrams.any? {|ele| ele.join("") == str_2 }
end



# p first_anagram?("abc", "cba")

def second_anagram?(str_1, str_2)
  str_2 = str_2.split("")
  str_1.each_char do |char|
    str_2.delete_at(str_2.index(char))
  end

  str_2.empty?
end
# p second_anagram?("abc", "cba")

def third_anagram?(str_1, str_2)
  str_1.split("").sort == str_2.split("").sort
end

p third_anagram?("abc", "bca")


def fourth_anagram?(str_1, str_2)

  hash_1 = {}
  hash_2 = {}

  str_1.each_char do |char|
    hash_1[char] ||= 0
    hash_1[char] += 1
  end

  str_2.each_char do |character|
    hash_2[character] ||= 0
    hash_2[character] += 1
  end

  hash_1 == hash_2

end

p fourth_anagram?("abc", "cba")

# Use two arrs of size 26 to store each characters frequency, then compare the arrs to see if they are equal.
def fifth_anagram?(str_1, str_2)
  arr_1 = Array.new(26, 0)
  arr_2 = Array.new(26, 0)

  str_1.each_char do |char|
    arr_1[char.ord - "a".ord] += 1
  end

  str_2.each_char do |char|
    arr_2[char.ord - "a".ord] += 1
  end

  arr_1 == arr_2
end

p fifth_anagram?("abcdef", "defcba")
