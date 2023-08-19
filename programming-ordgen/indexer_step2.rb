require 'ordlite'
require 'unisat'

## read records from cache
cache = Unisat::Cache.new( './unisat' )
recs =  cache.read( 'diyphunks' )
puts "   #{recs.size} record(s)" 
#=> 21 record(s)

OrdDb.open( './ordbase.db' )
OrdDb.import( recs )

puts
puts "  #{Inscribe.count} inscribe(s)"
puts "  #{Blob.count} blob(s)"


puts "bye"