####
# to run use:
#   $ ruby pipeline2/sync.rb


$LOAD_PATH.unshift( "./ordlite/lib" )
require 'ordlite'

OrdDb.connect( adapter:  'sqlite3',
               database: './ord.db' )

## build schema if database new/empty
OrdDb.auto_migrate!


cache =  OrdDb::Cache.new( '../ordinals.cache/btc' )
cache.import_all



puts
puts "  #{Inscribe.count} inscribe(s)"
puts "  #{Blob.count} blob(s)"


puts "bye"