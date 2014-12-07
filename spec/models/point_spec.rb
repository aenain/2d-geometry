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