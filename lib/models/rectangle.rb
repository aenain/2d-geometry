require 'forwardable'

class Rectangle
  extend Forwardable

  attr_reader :range_x, :range_y

  def_delegator :range_x, :min, :min_x
  def_delegator :range_x, :max, :max_x
  def_delegator :range_y, :min, :min_y
  def_delegator :range_y, :max, :max_y

  def self.from_ranges(range_x, range_y)
    sort_range = ->(range) do
      range.min ? range : range.last..range.first
    end
    new(sort_range.call(range_x), sort_range.call(range_y))
  end

  def self.from_points(*points)
    to_range = ->(ary) { ary.min..ary.max }
    range_x = to_range.call(points.flatten.map(&:x))
    range_y = to_range.call(points.flatten.map(&:y))
    new(range_x, range_y)
  end

  def initialize(range_x, range_y)
    @range_x = range_x
    @range_y = range_y
  end

  def ==(other)
    range_x == other.range_x &&
    range_y == other.range_y
  end

  def cover?(point)
    range_x.cover?(point.x) &&
    range_y.cover?(point.y)
  end
end