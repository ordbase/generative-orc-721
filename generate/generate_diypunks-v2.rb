####
#  to run use
#    $ ruby ./sandbox/generate_diypunks-v2.rb

require 'pixelart'



## step 1 - read (local) spritesheet.png ("art layers")
diypunks    = Orc721::Generator.read( './diypunks/spritesheet.png',
                                        width: 24,
                                        height: 24 )


recs = read_csv( "./diypunks-v2/mint.csv" )
puts "   #{recs.size} record(s)"

## cut-down to max. limit for now; sorry
recs = recs[0, 721]
puts "   #{recs.size} record(s)"


recs.each_with_index do |rec,i|
  num = rec['num']
  g   = diypunks._parse( rec['g'] )

  puts "==> punk no. #{i} @ #{num} - g: #{g.inspect}"

  img = diypunks.generate( *g )

  img.save( "../ordbase.github.io/num/#{num}.png" )
  img.zoom(4).save( "../ordbase.github.io/num/#{num}@4x.png" )

  img.save( "../ordbase.github.io/diypunks/#{g.join('_')}.png" )
  img.zoom(4).save( "../ordbase.github.io/diypunks/#{g.join('_')}@4x.png" )
end


puts "bye"


