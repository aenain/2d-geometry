require 'spec_helper'
require 'intersectors/line_with_point'
require 'intersecting_object'
require 'models/line'
require 'models/point'

RSpec.describe 'intersecting line with point' do
  context 'with a point on the line' do
    it 'returns the point' do
      line = IntersectingObject.new(Line.new(2, -2))
      point = IntersectingObject.new(Point.new(3, 4))

      intersection = line.intersect(point)

      expect(intersection).to eq point
    end
  end

  context 'with a point outside the line' do
    it 'returns nil' do
      line = IntersectingObject.new(Line.new(2, -2))
      point = IntersectingObject.new(Point.new(3, 5))

      intersection = line.intersect(point)

      expect(intersection).to be_nil
    end
  end
end