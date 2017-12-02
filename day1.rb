
def solve(number)
  result = 0
  temp = number.to_s
  temp.chars.each_with_index do |x, index|
    result += x.to_i if x == temp.chars[index - 1]
  end

  result
end

puts solve(1122)
puts solve(1111)
puts solve(1234)
