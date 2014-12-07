require 'spec_helper'
require 'models/line'

RSpec.describe Line, '.from_points' do
  it 'returns a line going through points' do
    points = [Point.new(1, 2), Point.new(2, 3)]

    line = described_class.from_points(*points)

    expect(points.all? { |p| line.cover?(p) }).to eq true
  end
end

RSpec.describe Line, '#point_at' do
  context 'when both :x and :y passed' do
    it 'returns point at :x' do
      line = described_class.new(1, 1)

      point = line.point_at(x: 1, y: 3)

      expect(point).to eq Point.new(1, 2)
    end
  end

  context 'when horizontal and :y passed' do
    it 'returns nil' do
      line = described_class.new(0, 3)

      point = line.point_at(y: 3)

      expect(point).to be_nil
    end
  end

  context 'when nothing passed' do
    it 'returns nil' do
      line = described_class.new(1, 1)

      point = line.point_at

      expect(point).to be_nil
    end
  end
end