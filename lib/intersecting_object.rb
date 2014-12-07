require 'delegate'
require 'intersector_factory'

class IntersectingObject < SimpleDelegator
  def intersect(other, factory: IntersectorFactory)
    return nil unless object
    intersection = factory.new(self, other).intersect
    self.class.new(intersection) if intersection
  end

  def intersect_role
    object.class.name
  end

  private

  alias_method :object, :__getobj__
end