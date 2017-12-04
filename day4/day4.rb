
def solve(lines)
  valid = 0
  lines.each do |x|
    x.map! { |y| y.chars.sort.join }
    valid += 1 if x.uniq.length == x.length
  end
  valid
end

lines = []
File.foreach('day4/input') do |line|
  lines << line.split
end

puts solve(lines)

