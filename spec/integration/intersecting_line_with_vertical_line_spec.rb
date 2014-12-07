require 'spec_helper'
require 'intersectors/line_with_vertical_line'
require 'intersecting_object'
require 'models/vertical_line'
require 'models/line'
require 'models/point'

RSpec.describe 'intersecting line with vertical line' do
  it 'returns correct point' do
    vertical_line = VerticalLine.new(3)
    line = Line.new(1, 1)

    intersection = IntersectingObject.new(vertical_line)
      .intersect(line)

    expect(intersection).to eq Point.new(3, 4)
  end
end