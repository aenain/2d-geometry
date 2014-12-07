require 'spec_helper'
require 'range_intersection'

RSpec.describe Range, '.&' do
  using RangeIntersection

  context 'when separate ranges' do
    it 'returns nil' do
      intersection = (1..3) & (4..5)
      expect(intersection).to be_nil
    end
  end

  context 'when first covers second' do
    it 'returns second' do
      intersection = (1..3) & (1.5..2.5)
      expect(intersection).to eq 1.5..2.5
    end
  end

  context 'when overlap each other' do
    it 'returns common part' do
      intersection = (1..3) & (2..4)
      expect(intersection).to eq 2..3
    end
  end

  context 'when diminishing ranges' do
    it 'works properly' do
      intersection = (3..1) & (1..3)
      expect(intersection).to eq 1..3
    end
  end
end