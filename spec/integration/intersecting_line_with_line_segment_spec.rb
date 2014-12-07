require 'spec_helper'
require 'models/line_segment'
require 'intersectors/line_with_line_segment'
require 'intersectors/line_with_rectangle'

RSpec.describe 'intersecting line with segment' do
  context 'when line shared' do
    it 'returns common segment on the line' do
      points = [
        Point.new(0, 1),
        Point.new(3, 4)
      ]
      line = Line.from_points(*points)
      segment = LineSegment.new(*points)

      intersection = IntersectingObject.new(line).intersect(segment)

      expect(intersection).to eq segment
    end
  end

  context 'when crossed' do
    it 'returns common point' do
      line = Line.new(-1, 0)
      segment = LineSegment.new(
        Point.new(-2, -2),
        Point.new(2, 2)
      )

      intersection = IntersectingObject.new(line).intersect(segment)

      expect(intersection).to eq Point.new(0, 0)
    end
  end

  context 'when nothing in common' do
    it 'returns nil' do
      line = Line.new(1, 0)
      segment = LineSegment.new(
        Point.new(1, 2),
        Point.new(2, 4)
      )

      intersection = IntersectingObject.new(line).intersect(segment)

      expect(intersection).to be_nil
    end
  end
end