####
# to run use:
#   $ ruby -I ./lib sandbox/setup.rb

require 'ordlite'


OrdDb.connect( adapter:  'sqlite3',
               database: './ord.db' )

## build schema
OrdDb.create_all


cache =  OrdDb::Cache.new( '../../ordinals.cache/btc' )
cache.import_all



puts
puts "  #{Inscribe.count} inscribe(s)"
puts "  #{Blob.count} blob(s)"


puts "bye"