def solve(input)
  input.map { |x| x.max - x.min }.inject(:+)
end

lines = []
File.foreach('day2/input') do |line|
  lines << line.split.map(&:to_i)
end

puts solve(lines)
