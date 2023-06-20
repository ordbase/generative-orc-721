####
#  to run use
#    $ ruby ./generate/diymartians.rb

require 'ordgen'


## note: change outdir (root for /num & /diypunks)
##          to where you want to save the generated images
outdir = '../ordbase.github.io'
# outdir = './tmp'



## step 1 - read (local) spritesheet.png ("art layers")
diymartians    = Ordgen.read( './docs/diymartians/spritesheet.png',
                                        width: 24,
                                        height: 24 )



## step 2 - read mint records
recs = read_csv( "./diymartians/mint.csv" )
puts "   #{recs.size} record(s)"

# cut-down to max. limit
# recs = recs[0, 100]
# puts "   #{recs.size} record(s)"


## step 3 - auto-generate public images
recs.each_with_index do |rec,i|
  num = rec['num']
  g   = diymartians._parse( rec['g'] )

  puts "==> martian no. #{i} @ #{num} - g: #{g.inspect}"

  img = diymartians.generate( *g )

  img.save( "#{outdir}/num/#{num}.png" )
  img.zoom(4).save( "#{outdir}/num/#{num}@4x.png" )

  ## img.save( "#{outdir}/diyaliens/#{g.join('_')}.png" )
  ## img.zoom(4).save( "#{outdir}/diyaliens/#{g.join('_')}@4x.png" )
end


puts "bye"

