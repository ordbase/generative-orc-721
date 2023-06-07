####
#  to run use
#    $ ruby ./sandbox/generate_btcwords.rb

###
#  note: requires latest pixelart bug fix (for composite)
#    uses (local) source version for now
$LOAD_PATH.unshift( "../pixelart/pixelart/lib" )
require 'pixelart'


## step 1 - read (local) spritesheet.png ("art layers")

slug = 'btcwords'
width  = 102
height = 32


spritesheet = ImageComposite.read( "./docs/#{slug}/spritesheet.png",
                                      width: width,
                                      height: height )


recs = read_csv( "./#{slug}/mint.csv" )
puts "   #{recs.size} record(s)"


recs.each_with_index do |rec,i|
  img = Image.new( width, height )
  g = rec['g'].split( ' ' ).map {|v| v.to_i(10) }
  puts "==> no. #{i}   g: #{rec['g']} - #{g.inspect}"
  g.each do |num|
     img.compose!( spritesheet[ num ] )
  end

  num = rec['num']
  img.save( "../ordbase.github.io/content/#{num}.png" )
  img.zoom(4).save( "../ordbase.github.io/content/#{num}@4x.png" )

  img.save( "../ordbase.github.io/#{slug}/#{g.join('_')}.png" )
  img.zoom(4).save( "../ordbase.github.io/#{slug}/#{g.join('_')}@4x.png" )
end


puts "bye"


