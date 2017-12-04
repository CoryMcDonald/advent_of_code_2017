
def solve(number)
  result = 0
  temp = number.to_s
  temp.chars.each_with_index do |x, index|
    result += x.to_i if x == temp.chars[index - 1]
  end

  result
end

def part2(number)
  result = 0
  list = number.chars
  length = list.length
  edge = length / 2
  list[0, edge].each_with_index do |x, index|
    result += x.to_i if x == list[edge, length][index]
  end

  result * 2
end

puts part2('123123')
