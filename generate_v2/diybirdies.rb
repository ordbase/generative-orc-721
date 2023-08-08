####
#  to run use
#    $ ruby generate_v2/diybirdies.rb

require_relative 'helper'



## note: change outdir (root for /num & /diybirdies)
##          to where you want to save the generated images
# outdir = '../ordbase.github.io'
outdir = './tmpv2'



## step 1 - read database "factory" record, that is, ordgen / ORC-721 deploy inscribe 
rec = Factory.find( 'diybirdies' )

puts "==> #{rec.id} >#{rec.name}< max. #{rec.max} - #{rec.dim} - inscribe no. #{rec.inscribe.num} - #{rec.inscribe.date}"
 
puts "   #{rec.layers.count} layer(s):"

generator = rec.generator
puts "      #{generator.count} tile(s)"



## step 2 - read mint records
puts "  #{rec.generatives.count} generative(s)" 
generatives = rec.generatives.joins(:inscribe)
                 .order('num').limit( rec.max )  ## cut-off "cursed" overflow "negatives" if any



## step 3 - auto-generate public images



generatives.each_with_index do |gen,i|
  num  = gen.inscribe.num
  id   = gen.inscribe.id

  g   = generator._parse( gen.g )

  puts "==> bird no. #{i} @ #{num} - g: #{g.inspect}"

  img = generator.generate( *g )

  img.save( "#{outdir}/num/#{num}.png" )
  img.zoom(4).save( "#{outdir}/num/#{num}@4x.png" )

  img.save( "#{outdir}/content/#{id}.png" )
end


puts "bye"
