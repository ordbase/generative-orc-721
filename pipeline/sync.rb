####
# to run use:
#   $ ruby pipeline/sync.rb

$LOAD_PATH.unshift( "../ordbase/ordinals/lib" )
$LOAD_PATH.unshift( "../ordbase/ordlite/lib" )
require 'ordlite'


cache = Ordinals::Cache.new( '../ordinals.cache/inscription' )
cache.add_dir( './inbox' )



OrdDb.open( './ord.db' )
cache.import_all

puts
puts "  #{Inscribe.count} inscribe(s)"
puts "  #{Blob.count} blob(s)"


puts "bye"