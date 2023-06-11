####
#  to run use
#    $ ruby ./generate/diyordibots.rb

require 'pixelart'


## note: change outdir (root for /num & /diyordibots)
##          to where you want to save the generated images
outdir = '../ordbase.github.io'


## step 1 - read (local) spritesheet.png ("art layers")

diyordibots   = Orc721::Generator.read( './diyordibots/spritesheet.png',
                                          width: 32,
                                          height: 32 )



####
#  auto-add  to  public image host @ ordbase.github.io


recs = read_csv( "./diyordibots/mint.csv" )
puts "   #{recs.size} record(s)"

# cut-down to max. limit
# recs = recs[0, 100]
# puts "   #{recs.size} record(s)"


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


