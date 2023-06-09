####
#  to run use
#    $ ruby ./sandbox/generate_btcwords.rb

require 'pixelart'


## step 1 - read (local) spritesheet.png ("art layers")

btcwords   = Orc721::Generator.read( './docs/btcwords/spritesheet.png',
                                          width: 102,
                                          height: 32 )

recs = read_csv( "./btcwords/mint.csv" )
puts "   #{recs.size} record(s)"


recs.each_with_index do |rec,i|
  num = rec['num']
  g   = btcwords._parse( rec['g'] )

  puts "==> word no. #{i} @ #{num} - g: #{g.inspect}"

  img = btcwords.generate( *g )

  img.save( "../ordbase.github.io/num/#{num}.png" )
  img.zoom(4).save( "../ordbase.github.io/num/#{num}@4x.png" )

  img.save( "../ordbase.github.io/btcwords/#{g.join('_')}.png" )
  img.zoom(4).save( "../ordbase.github.io/btcwords/#{g.join('_')}@4x.png" )
end


puts "bye"
