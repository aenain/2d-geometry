require 'spec_helper'
require 'intersectors/line_with_line'
require 'intersecting_object'
require 'models/line'
require 'models/point'

RSpec.describe 'intersecting lines' do
  context 'with a crossing line' do
    it 'returns the point' do
      line_a = IntersectingObject.new(Line.new(1, 0))
      line_b = IntersectingObject.new(Line.new(2, -2))

      intersection = line_a.intersect(line_b)

      expect(intersection).to eq Point.new(2, 2)
    end
  end

  context 'with the same line' do
    it 'returns the line' do
      line_a = IntersectingObject.new(Line.new(1, 0))
      line_b = IntersectingObject.new(Line.new(1, 0))

      intersection = line_a.intersect(line_b)

      expect(intersection).to eq line_a
    end
  end

  context 'with a parallel line' do
    it 'returns nil' do
      line_a = IntersectingObject.new(Line.new(1, -1))
      line_b = IntersectingObject.new(Line.new(1, 1))

      intersection = line_a.intersect(line_b)

      expect(intersection).to be_nil
    end
  end
end