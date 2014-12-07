require 'spec_helper'
require 'intersectors/vertical_line_with_vertical_line'
require 'intersecting_object'
require 'models/vertical_line'

RSpec.describe 'intersecting lines' do
  context 'with the same line' do
    it 'returns the line' do
      line_a = IntersectingObject.new(VerticalLine.new(1))
      line_b = IntersectingObject.new(VerticalLine.new(1))

      intersection = line_a.intersect(line_b)

      expect(intersection).to eq line_a
    end
  end

  context 'with a different line' do
    it 'returns nil' do
      line_a = IntersectingObject.new(VerticalLine.new(-1))
      line_b = IntersectingObject.new(VerticalLine.new(1))

      intersection = line_a.intersect(line_b)

      expect(intersection).to be_nil
    end
  end
end