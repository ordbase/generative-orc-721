######################
#  to run use
#   $  ruby  pipeline2/prepare.rb

require 'ordinals'


require_relative 'cache'


cache = Ordinals::Cache.new( '../ordinals.cache/inscription' )
cache.add_dir( './inbox' )

puts "bye"

