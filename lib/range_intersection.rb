require 'delegate'

module RangeIntersection
  class MinMax < SimpleDelegator
    def &(other)
      min = nil
      max = nil

      min = if cover?(other.min)
        other.min
      elsif other.cover?(self.min)
        self.min
      end

      max = if cover?(other.max)
        other.max
      elsif other.cover?(self.max)
        self.max
      end

      min..max if min && max
    end

    # Range#min returns nil if first is the max
    def min
      last <= first ? last : first
    end

    # Range#max returns nil if last is the max
    def max
      first >= last ? first : last
    end
  end

  refine Range do
    def intersect(other)
      MinMax.new(self) & MinMax.new(other)
    end
    alias_method :&, :intersect
  end
end
