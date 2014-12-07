module Intersectors
  VerticalLineWithVerticalLine = Struct.new(:line_a, :line_b) do
    def intersect
      line_a if line_a == line_b
    end

    private :line_a, :line_b
  end
end