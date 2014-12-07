require 'spec_helper'
require 'models/point'

RSpec.describe Point, '#==' do
  context 'with the same coordinates' do
    it 'returns true' do
      expect(described_class.new(1, 2)).to eq described_class.new(1, 2)
    end
  end

  context 'with different coordinates' do
    it 'returns false' do
      expect(described_class.new(1, 2)).to_not eq described_class.new(3, 4)
    end
  end
end

RSpec.describe Point, '#coords' do

end

RSpec.describe Point, 'being unique' do
  context 'when the same coordinates' do
    it 'acts as duplicate' do
      points = [Point.new(1.0, 2), Point.new(1, 2.0)]

      expect(points.uniq(&:coords).count).to eq 1
    end
  end

  context 'when different coords' do
    it 'acts as unique' do
      points = [Point.new(1.5, 2), Point.new(3, 2)]

      expect(points.uniq(&:coords).count).to eq 2
    end
  end
end