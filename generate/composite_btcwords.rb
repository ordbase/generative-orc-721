require 'pixelart'


## step 1 - read (local) spritesheet.png ("art layers")

btcwords   = Orc721::Generator.read( './docs/btcwords/spritesheet.png',
                                          width: 102,
                                          height: 32 )


recs = read_csv( "./btcwords/mint.csv" )
puts "   #{recs.size} record(s)"


## cut down to first fifty, next fifty
offset = 300
recs = recs[offset, 50]
puts "   #{recs.size} record(s)"


composite = ImageComposite.new( 5, 10,  width:  btcwords.width,
                                        height: btcwords.height )


recs.each_with_index do |rec,i|
  num = rec['num']
  g   = btcwords._parse( rec['g'] )
  puts "==> no. #{i+offset} @ #{num}  g: #{rec['g']} - #{g.inspect}"
  img = btcwords.generate( *g )

  # img.save( "./tmp/btcwords#{i+offset}.png" )
  # img.zoom(4).save( "./tmp/btcwords#{i+offset}@4x.png" )

  composite << img
end



composite.save( "./tmp/btcwords_#{offset}.png" )
# composite.zoom(4).save( "./tmp/btcwords_#{offset}@4x.png" )



puts "bye"

