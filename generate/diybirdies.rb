####
#  to run use
#    $ ruby ./generate/diybirdies.rb

require 'pixelart'


## note: change outdir (root for /num & /diypunks)
##          to where you want to save the generated images
outdir = '../ordbase.github.io'



## step 1 - read (local) spritesheet.png ("art layers")
diybirdies    = Orc721::Generator.read( './diybirdies/spritesheet.png',
                                        width: 24,
                                        height: 24 )



####
#  auto-add to public image host @ ordbase.github.io

recs = read_csv( "./diybirdies/mint.csv" )
puts "   #{recs.size} record(s)"

# cut-down to max. limit
# recs = recs[0, 100]
# puts "   #{recs.size} record(s)"



recs.each_with_index do |rec,i|
  num = rec['num']
  g   = diybirdies._parse( rec['g'] )

  puts "==> bird no. #{i} @ #{num} - g: #{g.inspect}"

  img = diybirdies.generate( *g )

  img.save( "#{outdir}/num/#{num}.png" )
  img.zoom(4).save( "#{outdir}/num/#{num}@4x.png" )

  img.save( "#{outdir}/diybirdies/#{g.join('_')}.png" )
  img.zoom(4).save( "#{outdir}/diybirdies/#{g.join('_')}@4x.png" )
end


puts "bye"

