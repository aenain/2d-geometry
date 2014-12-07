require 'spec_helper'
require 'models/rectangle'
require 'models/line'
require 'models/line_segment'
require 'models/point'
require 'intersecting_object'
require 'intersectors/line_with_rectangle'

RSpec.describe 'intersecting line with a rectangle' do
  context 'when edge is on the line' do
    it 'returns the edge' do
      rect = Rectangle.from_ranges(0..2, 0..2)
      line = Line.new(0, 0)

      intersection = IntersectingObject.new(rect)
        .intersect(line)

      expect(intersection).to eq LineSegment.new(
        Point.new(0, 0),
        Point.new(2, 0)
      )
    end
  end

  context 'when line goes through the rectangle' do
    it 'returns a line segment' do
      rect = Rectangle.from_ranges(0..2, 0..2)
      line = Line.new(1, 0)

      intersection = IntersectingObject.new(rect)
        .intersect(line)

      expect(intersection).to eq LineSegment.new(
        Point.new(0, 0),
        Point.new(2, 2)
      )
    end
  end

  context 'when nothing in common' do
    it 'returns nil' do
      rect = Rectangle.from_ranges(0..2, 0..2)
      line = Line.new(1, 3)

      intersection = IntersectingObject.new(rect)
        .intersect(line)

      expect(intersection).to be_nil
    end
  end
end