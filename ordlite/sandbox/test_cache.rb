####
# to run use:
#   $ ruby -I ./lib sandbox/test_cache.rb

require 'ordlite'



OrdDb.setup_in_memory_db


cache =  OrdDb::Cache.new( '../../ordinals.cache/btc' )

cache.import_all


# pp cache.import( '0a3a4dbf6630338bc4df8e36bd081f8f7d2dee9441131cb03a18d43eb4882d5ci0' )
# pp cache.import( '0a5813053f3c6bae54f39adf38e3b260c34d530304b7fc2e95eb7871e14a9790i0' )



puts
pp Inscribe.find_by( block: 792324 )

pp Inscribe.find_by( num: 10364184 )

pp Inscribe.find( '0a5813053f3c6bae54f39adf38e3b260c34d530304b7fc2e95eb7871e14a9790i0' )


puts
puts "  #{Inscribe.count} inscribe(s)"
puts "  #{Blob.count} blob(s)"


puts "bye"