require 'spec_helper'

RSpec.describe 'intersecting rectangles' do
  context 'when common rectangle' do
    it 'returns rectangle' do
      rect_a = Rectangle.from_ranges(0..2, 0..2)
      rect_b = Rectangle.from_ranges(1..3, 1..3)

      intersection = IntersectingObject.new(rect_a)
        .intersect(rect_b)

      expect(intersection).to eq Rectangle.from_ranges(1..2, 1..2)
    end
  end

  context 'when common edge' do
    it 'returns line segment' do
      rect_a = Rectangle.from_ranges(0..1, 0..1)
      rect_b = Rectangle.from_ranges(0..2, 1..4)

      intersection = IntersectingObject.new(rect_a)
        .intersect(rect_b)

      expect(intersection).to eq LineSegment.new(
        Point.new(0, 1),
        Point.new(1, 1)
      )
    end
  end

  context 'when common vertex' do
    it 'returns point' do
      rect_a = Rectangle.from_ranges(0..1, 0..1)
      rect_b = Rectangle.from_ranges(1..4, 1..4)

      intersection = IntersectingObject.new(rect_a)
        .intersect(rect_b)

      expect(intersection).to eq Point.new(1, 1)
    end
  end

  context 'when nothing in common' do
    it 'returns nil' do
      rect_a = Rectangle.from_ranges(0..1, 0..1)
      rect_b = Rectangle.from_ranges(2..4, 2..4)

      intersection = IntersectingObject.new(rect_a)
        .intersect(rect_b)

      expect(intersection).to be_nil
    end
  end
end