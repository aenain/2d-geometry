require 'intersecting_object'
require 'intersector_factory'
require 'intersectors/line_with_point'

RSpec.describe IntersectorFactory, '.new' do
  context 'with line and point' do
    it 'returns a dedicated strategy' do
      line = instance_double('IntersectingObject', intersect_role: 'Line')
      point = instance_double('IntersectingObject', intersect_role: 'Point')

      strategy = described_class.new(line, point)

      expect(strategy).to be_kind_of Intersectors::LineWithPoint
    end

    it 'is commutative' do
      line = instance_double('IntersectingObject', intersect_role: 'Line')
      point = instance_double('IntersectingObject', intersect_role: 'Point')

      line_with_point = described_class.new(line, point)
      point_with_line = described_class.new(point, line)

      expect(line_with_point).to eq point_with_line
    end
  end
end