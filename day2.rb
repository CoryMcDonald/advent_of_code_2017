def solve(input)
  input.map { |x| x.max - x.min }.inject(:+)
end

def solve2(input)
  input
    .map { |x| divisible(x) }
    .inject(:+)
end

def divisible(array)
  array.combination(2).each do |x|
    to_divide = x.sort.reverse
    return to_divide.inject(:/) if to_divide.inject(:%).zero?
  end
end

lines = []
File.foreach('day2/input') do |line|
  lines << line.split.map(&:to_i)
end

puts solve2(lines)
