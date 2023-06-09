####
#  to run use
#    $ ruby ./sandbox/generate_diycoolcats.rb

require 'pixelart'



## step 1 - read (local) spritesheet.png ("art layers")
diycoolcats    = Orc721::Generator.read( './diycoolcats/spritesheet.png',
                                          width: 24,
                                          height: 24 )


####
#  auto-add  to  public image host @ ordbase.github.io

recs = read_csv( "./diycoolcats/mint.csv" )
puts "   #{recs.size} record(s)"

# cut-down to max. limit
# recs = recs[0, 100]
# puts "   #{recs.size} record(s)"



recs.each_with_index do |rec,i|
  num = rec['num']
  g   = diycoolcats._parse( rec['g'] )

  puts "==> cat no. #{i} @ #{num} - g: #{g.inspect}"

  img = diycoolcats.generate( *g )

  img.save( "../ordbase.github.io/num/#{num}.png" )
  img.zoom(4).save( "../ordbase.github.io/num/#{num}@4x.png" )

  img.save( "../ordbase.github.io/diycoolcats/#{g.join('_')}.png" )
  img.zoom(4).save( "../ordbase.github.io/diycoolcats/#{g.join('_')}@4x.png" )
end


puts "bye"

