####
#  to run use
#    $ ruby generate_v2/diyapes.rb


require_relative 'helper'


## note: change outdir (root for /num & /diypunks)
##          to where you want to save the generated images
outdir = './tmpv2'


## step 1 - read database "factory" record, that is, ordgen / ORC-721 deploy inscribe 
rec = Factory.find( 'diyapes' )

puts "==> #{rec.id} >#{rec.name}< max. #{rec.max} - #{rec.dim} - inscribe no. #{rec.inscribe.num} - #{rec.inscribe.date}"
 
puts "   #{rec.layers.count} layer(s):"

generator = rec.generator
puts "      #{generator.count} tile(s)"




## step 2 - read mint records
recs = read_csv( "./diyapes/mint.csv" )
puts "   #{recs.size} record(s)"

# cut-down to max. limit
# recs = recs[0, 100]
# puts "   #{recs.size} record(s)"


## step 3 - auto-generate public images
recs.each_with_index do |rec,i|
  num = rec['num']
  g   = generator._parse( rec['g'] )

  puts "==> apes no. #{i} @ #{num} - g: #{g.inspect}"

  img = generator.generate( *g )

  img.save( "#{outdir}/num/#{num}.png" )
  img.zoom(4).save( "#{outdir}/num/#{num}@4x.png" )

  img.save( "#{outdir}/diyapes/#{g.join('_')}.png" )
  img.zoom(4).save( "#{outdir}/diyapes/#{g.join('_')}@4x.png" )
end


puts "bye"

