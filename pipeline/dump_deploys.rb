####
# to run use:
#   $ ruby pipeline/dump_deploys.rb

$LOAD_PATH.unshift( "../ordbase/ordinals/lib" )
$LOAD_PATH.unshift( "../ordbase/ordlite/lib" )
require 'ordlite'


OrdDb.open( './ord.db' )


puts
puts "  #{Inscribe.count} inscribe(s)"
puts "  #{Blob.count} blob(s)"
puts "  #{Collection.count} collections(s)"
puts "  #{Factory.count} factories"
puts "  #{Generative.count} generative(s)"



### quick (double)check for deploy config/settings
require_relative 'config'

puts "  #{DEPLOYS.size} deploys"
DEPLOYS.each_with_index do |(id, h), i|
    fac = Factory.find( id )
    if fac.inscribe.num != h['num']
        puts "!! ERROR - inscribe no not matching; #{fac.inscribe.num} <=> #{h['num']}"
        exit 1
    end
end

Factory.all.each_with_index do |fac,i|
   puts "==> #{i+1} @ #{fac.inscribe.num}  #{fac.id} max. #{fac.max}, dim. #{fac.dim} - #{fac.inscribe.date}..."
   puts "    #{fac.name}"    
end

puts "bye"