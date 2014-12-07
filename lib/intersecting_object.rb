require 'delegate'
require 'intersector_factory'

class IntersectingObject < SimpleDelegator
  def intersect(other, factory: default_factory)
    return nil unless object
    intersection = factory.new(self, wrap(other)).intersect
    wrap(intersection) if intersection
  end

  def intersect_role
    object.class.name
  end

  private

  def wrap(object)
    if object.kind_of?(self.class)
      object
    else
      self.class.new(object)
    end
  end

  def default_factory
    IntersectorFactory
  end

  alias_method :object, :__getobj__
end