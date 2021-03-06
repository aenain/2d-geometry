require 'models/point'

module Intersectors
  LineWithLine = Struct.new(:line_a, :line_b) do
    def intersect
      if line_a == line_b
        line_a
      elsif line_a.a != line_b.a
        x = (line_b.b - line_a.b).to_f / (line_a.a - line_b.a)
        Point.new(x, line_a.value(x))
      end
    end

    private :line_a, :line_b
  end
end