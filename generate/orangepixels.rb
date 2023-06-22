####
#  to run use
#    $ ruby generate/orangepixels.rb

require 'ordgen'


## note: change outdir (root for /num & /btcwords)
##          to where you want to save the generated images
outdir = '../ordbase.github.io'
# outdir = './tmp/orangepixels'


## step 1 - read (local) spritesheet.png ("art layers")
orangepixels   = Ordgen.read( './orangepixels/spritesheet.png',
                                          width: 24,
                                          height: 24 )

## step 2 - read mint records
recs = read_csv( "./orangepixels/mint.csv" )
puts "   #{recs.size} record(s)"


## step 3 - auto-generate public images
recs.each_with_index do |rec,i|
  num = rec['num']
  g   = orangepixels._parse( rec['g'] )

  puts "==> pixel no. #{i} @ #{num} - g: #{g.inspect}"

  img = orangepixels.generate( *g )

  img.save( "#{outdir}/num/#{num}.png" )
  img.zoom(4).save( "#{outdir}/num/#{num}@4x.png" )

  # img.save( "#{outdir}/orangepixels/#{g.join('_')}.png" )
  # img.zoom(4).save( "#{outdir}/orangepixels/#{g.join('_')}@4x.png" )
end


puts "bye"
