require 'spec_helper'
require 'models/rectangle'
require 'models/vertical_line'
require 'models/line_segment'
require 'models/point'
require 'intersecting_object'
require 'intersectors/rectangle_with_vertical_line'

RSpec.describe 'intersecting rectangle with a vertical line' do
  context 'when edge is on the line' do
    it 'returns the edge' do
      rect = Rectangle.from_ranges(0..2, 0..2)
      line = VerticalLine.new(2)

      intersection = IntersectingObject.new(rect)
        .intersect(line)

      expect(intersection).to eq LineSegment.new(
        Point.new(2, 0),
        Point.new(2, 2)
      )
    end
  end

  context 'when line goes through the rectangle' do
    it 'returns a line segment' do
      rect = Rectangle.from_ranges(0..2, 0..2)
      line = VerticalLine.new(1)

      intersection = IntersectingObject.new(rect)
        .intersect(line)

      expect(intersection).to eq LineSegment.new(
        Point.new(1, 0),
        Point.new(1, 2)
      )
    end
  end

  context 'when nothing in common' do
    it 'returns nil' do
      rect = Rectangle.from_ranges(0..2, 0..2)
      line = VerticalLine.new(3)

      intersection = IntersectingObject.new(rect)
        .intersect(line)

      expect(intersection).to be_nil
    end
  end
end