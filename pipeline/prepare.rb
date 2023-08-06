######################
#  to run use
#   $  ruby  pipeline/prepare.rb

$LOAD_PATH.unshift( "../ordbase/ordinals/lib" )
require 'ordinals'


cache = Ordinals::Cache.new( '../ordinals.cache/inscription' )
cache.add_dir( './inbox' )

puts "bye"

