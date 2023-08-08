$LOAD_PATH.unshift( "../ordbase/ordinals/lib" )
$LOAD_PATH.unshift( "../ordbase/ordlite/lib" )
require 'ordlite'


OrdDb.open( './ord.db' )


puts
puts "  #{Inscribe.count} inscribe(s)"
puts "  #{Blob.count} blob(s)"
puts "  #{Collection.count} collection(s)"
puts "  #{Factory.count} factories"
puts "  #{Generative.count} generative(s)"
