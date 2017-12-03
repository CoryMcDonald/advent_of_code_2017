require 'pry'

class Square
  attr_accessor :x, :y, :value

  def initialize(x, y, value)
    @x = x
    @y = y
    @value = value
  end

  def to_s
    "#{x}\t#{y}\t#{value}"
  end
end

# shamelessly stolen from stack overflow
def generate_spiral(xDim, yDim)
  sx = xDim / 2
  sy = yDim / 2

  cx = cy = 0
  direction = distance = 1

  yield(cx,cy)
  while(cx.abs <= sx || cy.abs <= sy)
     distance.times { cx += direction; yield(cx,cy) if(cx.abs <= sx && cy.abs <= sy); }
     distance.times { cy += direction; yield(cx,cy) if(cx.abs <= sx && cy.abs <= sy); }
     distance += 1
     direction *= -1
  end
end

def solve(number)
  size = Math.sqrt(number).ceil

  i = 1
  generate_spiral(size, size) { |x, y|
    return x.abs + y.abs if i == number
    i += 1
  }
end

def solve2(number)
  temp = []

  size = Math.sqrt(number).ceil

  temp << Square.new(0, 0, 1)
  generate_spiral(size, size) { |x, y|
    sum = 0
    sum += temp.select { |t| t.x == x-1 && t.y == y }.first&.value.to_i
    sum += temp.select { |t| t.x == x+1 && t.y == y }.first&.value.to_i
    sum += temp.select { |t| t.x == x && t.y == y-1 }.first&.value.to_i
    sum += temp.select { |t| t.x == x && t.y == y+1 }.first&.value.to_i
    sum += temp.select { |t| t.x == x-1 && t.y == y-1 }.first&.value.to_i
    sum += temp.select { |t| t.x == x+1 && t.y == y-1 }.first&.value.to_i
    sum += temp.select { |t| t.x == x+1 && t.y == y+1 }.first&.value.to_i
    sum += temp.select { |t| t.x == x-1 && t.y == y+1 }.first&.value.to_i

    temp << Square.new(x, y, sum) unless x == 0 && y == 0

    return sum if sum > number
  }
end

puts solve2(289326)

