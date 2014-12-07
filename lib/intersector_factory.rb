class IntersectorFactory
  def self.new(obj_a, obj_b)
    args = [obj_a, obj_b].sort_by(&:intersect_role)
    name = args.map(&:intersect_role).join('With')
    Intersectors.const_get(name).new(*args)
  end
end