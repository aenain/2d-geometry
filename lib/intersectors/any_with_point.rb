module Intersectors
  AnyWithPoint = Struct.new(:any, :point) do
    def intersect
      point if any.cover?(point)
    end

    private :any, :point
  end
end