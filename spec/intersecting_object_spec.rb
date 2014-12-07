require 'spec_helper'
require 'intersector_factory'
require 'models/point'
require 'intersecting_object'

RSpec.describe IntersectingObject, '#intersect_role' do
  it 'returns class name of the underlying object' do
    point = described_class.new(Point.new(1, 2))
    expect(point.intersect_role).to eq 'Point'
  end
end

RSpec.describe IntersectingObject, '#intersect' do
  context 'with intersection present' do
    it 'wraps the intersection' do
      intersecting = described_class.new(double(:point))
      intersected = double(:line)
      intersector = double(:intersector, intersect: double(:intersection))
      factory = class_double('IntersectorFactory', new: intersector)

      intersection = intersecting.intersect(intersected, factory: factory)

      expect(factory).to have_received(:new).with(intersecting, intersected)
      expect(intersection).to be_kind_of described_class
    end
  end

  context 'with empty intersection' do
    it 'returns nil' do
      intersecting = described_class.new(double(:point))
      intersected = double(:line)
      intersector = double(:intersector, intersect: nil)
      factory = class_double('IntersectorFactory', new: intersector)

      intersection = intersecting.intersect(intersected, factory: factory)

      expect(factory).to have_received(:new).with(intersecting, intersected)
      expect(intersection).to be_nil
    end
  end
end