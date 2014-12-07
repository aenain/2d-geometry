require 'spec_helper'
require 'models/line_segment'
require 'intersectors/line_with_rectangle'
require 'intersectors/line_segment_with_line_segment'
require 'intersectors/rectangle_with_rectangle'
require 'intersectors/point_with_rectangle'

RSpec.describe 'intersecting line segments' do
  context 'when line shared' do
    it 'returns common segment on the line' do
      segment_a = LineSegment.new(
        Point.new(0, 1),
        Point.new(3, 4)
      )
      segment_b = LineSegment.new(
        Point.new(1, 2),
        Point.new(2, 3)
      )

      intersection = IntersectingObject.new(segment_a)
        .intersect(segment_b)

      expect(intersection).to eq LineSegment.new(
        Point.new(1, 2),
        Point.new(2, 3)
      )
    end
  end

  context 'when crossed' do
    it 'returns common point' do
      segment_a = LineSegment.new(
        Point.new(0, 2),
        Point.new(2, 0)
      )
      segment_b = LineSegment.new(
        Point.new(0, 0),
        Point.new(2, 2)
      )

      intersection = IntersectingObject.new(segment_a)
        .intersect(segment_b)

      expect(intersection).to eq Point.new(1, 1)
    end
  end

  context 'when nothing in common' do
    it 'returns nil' do
      segment_a = LineSegment.new(
        Point.new(2, 2),
        Point.new(4, 4)
      )
      segment_b = LineSegment.new(
        Point.new(0, 0),
        Point.new(1, 1)
      )

      intersection = IntersectingObject.new(segment_a)
        .intersect(segment_b)

      expect(intersection).to be_nil
    end
  end
end