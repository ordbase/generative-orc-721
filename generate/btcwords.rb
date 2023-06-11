####
#  to run use
#    $ ruby ./generate/btcwords.rb

require 'pixelart'


## note: change outdir (root for /num & /btcwords)
##          to where you want to save the generated images
outdir = '../ordbase.github.io'



## step 1 - read (local) spritesheet.png ("art layers")

btcwords   = Orc721::Generator.read( './btcwords/spritesheet.png',
                                          width: 102,
                                          height: 32 )

recs = read_csv( "./btcwords/mint.csv" )
puts "   #{recs.size} record(s)"


recs.each_with_index do |rec,i|
  num = rec['num']
  g   = btcwords._parse( rec['g'] )

  puts "==> word no. #{i} @ #{num} - g: #{g.inspect}"

  img = btcwords.generate( *g )

  img.save( "#{outdir}/num/#{num}.png" )
  img.zoom(4).save( "#{outdir}/num/#{num}@4x.png" )

  img.save( "#{outdir}/btcwords/#{g.join('_')}.png" )
  img.zoom(4).save( "#{outdir}/btcwords/#{g.join('_')}@4x.png" )
end


puts "bye"
