require 'point'

class Line
  def initialize(a, b)
    @a = a
    @b = b
  end

  def intersect(line)
    if a == line.a && b == line.b
      self
    elsif a != line.a
      x = (line.b - b).to_f / (a - line.a)
      Point.new(x, a*x + b)
    end
  end

  protected

  attr_reader :a, :b
end