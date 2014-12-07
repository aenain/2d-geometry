require 'spec_helper'
require 'rectangle'

RSpec.describe Rectangle do
  describe '.from_ranges' do
    context 'with growing ranges' do
      subject { described_class.from_ranges(1..3, 2..4) }

      it 'builds a rect with passed ranges' do
        expect(subject.range_x).to eq 1..3
        expect(subject.range_y).to eq 2..4
      end
    end

    context 'with diminishing ranges' do
      subject { described_class.from_ranges(3..1, 4..2) }

      it 'builds a rect with growing ranges' do
        expect(subject.range_x).to eq 1..3
        expect(subject.range_y).to eq 2..4
      end
    end
  end

  describe '.from_points' do
    context 'when passed an array' do
      let(:points) do
        [
          instance_double('Point', x: 1, y: 3),
          instance_double('Point', x: -2, y: 4),
        ]
      end

      subject { described_class.from_points(points) }

      it 'builds a rect with ranges described by min and max on each axis' do
        expect(subject.range_x).to eq -2..1
        expect(subject.range_y).to eq 3..4
      end
    end
  end

  describe '#==' do
    context 'when ranges are equal' do

    end

    context 'when ranges for single axis are equal' do

    end
  end
end