require 'spec_helper'
require 'models/line_segment'

RSpec.describe LineSegment, '#line' do
  context 'when vertical' do
    it 'returns vertical line' do
      segment = LineSegment.new(Point.new(1, 1), Point.new(1, 2))

      line = segment.line

      expect(line).to eq VerticalLine.new(1)
    end
  end

  context 'when not vertical' do
    it 'returns line going through points' do
      points = [Point.new(1, 2), Point.new(2, 3)]
      segment = LineSegment.new(*points)

      line = segment.line

      expect(line).to eq Line.new(1, 1)
    end
  end
end

RSpec.describe LineSegment, '#rect' do
  context 'when vertical' do
    it 'returns vertical line' do
      segment = LineSegment.new(Point.new(1, 1), Point.new(1, 2))

      line = segment.line

      expect(line).to eq VerticalLine.new(1)
    end
  end

  context 'when not vertical' do
    it 'returns line going through points' do
      points = [Point.new(1, 2), Point.new(2, 3)]
      segment = LineSegment.new(*points)

      line = segment.line

      expect(line).to eq Line.new(1, 1)
    end
  end
end