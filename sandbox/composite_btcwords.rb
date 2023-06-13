require 'pixelart'


## step 1 - read (local) spritesheet.png ("art layers")

btcwords   = Orc721::Generator.read( './btcwords/spritesheet.png',
                                          width: 102,
                                          height: 32 )


recs = read_csv( "./btcwords/mint.csv" )
puts "   #{recs.size} record(s)"



## cut down to first fifty, next fifty
[0,50,100,150,200,250,300,350,400,450,500,550,600,650,700,750,800].each_with_index do |offset,i|
  puts "==> page #{i+1} starting at offset #{offset}"
  batch = recs[offset, 50]
  puts "   #{batch.size} record(s)"


  composite = ImageComposite.new( 5, 10,  width:  btcwords.width,
                                          height: btcwords.height )


  batch.each_with_index do |rec,i|
    num = rec['num']
    g   = btcwords._parse( rec['g'] )
    puts "==> no. #{i+offset} @ #{num}  g: #{rec['g']} - #{g.inspect}"
    img = btcwords.generate( *g )

    # img.save( "./tmp/btcwords#{i+offset}.png" )
    # img.zoom(4).save( "./tmp/btcwords#{i+offset}@4x.png" )

    composite << img
  end

  ## composite.save( "./btcwords/i/btcwords_#{offset}.png" )

  composite.save( "./tmp/btcwords_#{offset}.png" )
  # composite.zoom(4).save( "./tmp/btcwords_#{offset}@4x.png" )
end


puts "bye"

