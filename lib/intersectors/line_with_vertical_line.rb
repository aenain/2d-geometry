require 'models/point'

module Intersectors
  LineWithVerticalLine = Struct.new(:line, :vertical_line) do
    def intersect
      Point.new(vertical_line.x, line.value(vertical_line.x))
    end

    private :line, :vertical_line
  end
end