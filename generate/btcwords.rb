####
#  to run use
#    $ ruby ./generate/btcwords.rb

require 'ordgen'


## note: change outdir (root for /num & /btcwords)
##          to where you want to save the generated images
# outdir = '../ordbase.github.io'
outdir = './tmp'


## step 1 - read (local) spritesheet.png ("art layers")
btcwords   = Ordgen.read( './btcwords/spritesheet.png',
                                          width: 102,
                                          height: 32 )

## step 2 - read mint records
recs = read_csv( "./btcwords/mint.csv" )
puts "   #{recs.size} record(s)"


## step 3 - auto-generate public images
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
