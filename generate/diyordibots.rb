####
#  to run use
#    $ ruby ./generate/diyordibots.rb

require 'ordgen'


## note: change outdir (root for /num & /diyordibots)
##          to where you want to save the generated images
# outdir = '../ordbase.github.io'
outdir = './tmp'

## step 1 - read (local) spritesheet.png ("art layers")
diyordibots   = Ordgen.read( './diyordibots/spritesheet.png',
                                          width: 32,
                                          height: 32 )



## step 2 - read mint records
recs = read_csv( "./diyordibots/mint.csv" )
puts "   #{recs.size} record(s)"

# cut-down to max. limit
# recs = recs[0, 100]
# puts "   #{recs.size} record(s)"


## step 3 - auto-generate public images
recs.each_with_index do |rec,i|
  num = rec['num']
  g   = diyordibots._parse( rec['g'] )

  puts "==> bot no. #{i} @ #{num} - g: #{g.inspect}"

  img = diyordibots.generate( *g )

  img.save( "#{outdir}/num/#{num}.png" )
  img.zoom(4).save( "#{outdir}/num/#{num}@4x.png" )

  img.save( "#{outdir}/diyordibots/#{g.join('_')}.png" )
  img.zoom(4).save( "#{outdir}/diyordibots/#{g.join('_')}@4x.png" )
end


puts "bye"


