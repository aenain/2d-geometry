$LOAD_PATH.unshift('./lib')

Dir['./lib/models/*.rb'].each { |f| require_relative f }
Dir['./lib/intersectors/*.rb'].each { |f| require_relative f }

require 'range_intersection'
require 'intersecting_object'
require 'intersector_factory'