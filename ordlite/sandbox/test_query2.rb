####
# to run use:
#   $ ruby -I ./lib sandbox/test_query2.rb

require 'ordlite'


OrdDb.connect( adapter:  'sqlite3',
               database: './deploy.db' )



puts
puts "  #{Inscribe.count} inscribe(s)"
puts "  #{Blob.count} blob(s)"
puts "  #{Collection.count} collection(s)"
puts "  #{Generative.count} generative(s)"



####################
## query for collections

max = 10
Collection.joins(:inscribe).order('num desc').each_with_index do |rec,i|
  puts "==> #{i+1}  #{rec.id} >#{rec.name}< max. #{rec.max}"
  puts "   #{rec.layers.count} layer(s):"
  rec.layers.each_with_index do |layer,i|
     puts "   [#{i}]  #{layer.num} - #{layer.id}"
  end
  puts
  puts "   #{rec.inscribes.count} inscribe(s):"

  inscribes = rec.inscribes.joins(:generative).order('num desc').limit( max )
  inscribes.each_with_index do |ins, j|
     puts "   [#{j}] #{ins.num}  - #{ins.generative.g}"
  end

  puts
end



puts
puts "  #{Inscribe.count} inscribe(s)"
puts "  #{Blob.count} blob(s)"
puts "  #{Collection.count} collection(s)"
puts "  #{Generative.count} generative(s)"

puts "bye"