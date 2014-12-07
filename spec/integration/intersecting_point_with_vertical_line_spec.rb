require 'spec_helper'
require 'intersectors/point_with_vertical_line'
require 'intersecting_object'
require 'models/vertical_line'
require 'models/point'

RSpec.describe 'intersecting point with vertical line' do
  context 'with a point on the line' do
    it 'returns the point' do
      line = IntersectingObject.new(VerticalLine.new(3))
      point = IntersectingObject.new(Point.new(3, 4))

      intersection = line.intersect(point)

      expect(intersection).to eq point
    end
  end

  context 'with a point outside the line' do
    it 'returns nil' do
      line = IntersectingObject.new(VerticalLine.new(1))
      point = IntersectingObject.new(Point.new(3, 5))

      intersection = line.intersect(point)

      expect(intersection).to be_nil
    end
  end
end