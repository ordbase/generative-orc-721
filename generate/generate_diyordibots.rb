####
#  to run use
#    $ ruby ./sandbox/generate_diyordibots.rb

require 'pixelart'





## step 1 - read (local) spritesheet.png ("art layers")

diyordibots   = Orc721::Generator.read( './diyordibots/spritesheet.png',
                                          width: 32,
                                          height: 32 )


pp diyordibots._parse( '1_2_3' )
pp diyordibots._parse( ' 1 _ 2 _ 3 ' )
pp diyordibots._parse( ' 1 2  3 ' )



specs = [
  [1,4,7,21,24],
  [0,5,22,23,11],

  [2,5,16,23,9],

  [3,6,9,17,26],
  [2,4,16,23,9],

  [0,3,16,25,14],
 ]


specs.each do |attributes|
  puts "==> bot #{attributes.inspect}"
  bot = diyordibots.generate( *attributes )

  path = "./tmp/bot-#{attributes.join('_')}"
  bot.save( path+'bot' )
  bot.zoom(4).save( path+'@4x.png' )
end


####
#  auto-add first hundred to  public image host @ ordbase.github.io

recs = read_csv( "./diyordibots/mint.csv" )
puts "   #{recs.size} record(s)"

# cut-down to max. limit
recs = recs[0, 100]
puts "   #{recs.size} record(s)"



recs.each_with_index do |rec,i|
  num = rec['num']
  g   = diyordibots._parse( rec['g'] )

  puts "==> bot no. #{i} @ #{num} - g: #{g.inspect}"


  img = diyordibots.generate( *g )

  img.save( "../ordbase.github.io/num/#{num}.png" )
  img.zoom(4).save( "../ordbase.github.io/num/#{num}@4x.png" )

  img.save( "../ordbase.github.io/diyordibots/#{g.join('_')}.png" )
  img.zoom(4).save( "../ordbase.github.io/diyordibots/#{g.join('_')}@4x.png" )
end


puts "bye"


