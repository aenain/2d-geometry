require 'spec_helper'
require 'intersectors/point_with_point'
require 'intersecting_object'
require 'models/point'

RSpec.describe 'intersecting points' do
  context 'with the same point' do
    it 'returns the point itself' do
      point_a = IntersectingObject.new(Point.new(1, 2))
      point_b = Point.new(1, 2)

      intersection = point_a.intersect(point_b)

      expect(intersection).to eq point_a
    end
  end

  context 'with a different point' do
    it 'returns nil' do
      point_a = IntersectingObject.new(Point.new(1, 2))
      point_b = Point.new(3, 4)

      intersection = point_a.intersect(point_b)

      expect(intersection).to be_nil
    end
  end
end