###
#  note: requires latest pixelart bug fix (for composite)
#    uses (local) source version for now
$LOAD_PATH.unshift( "../pixelart/pixelart/lib" )
require 'pixelart'



slug = 'btcwords'
width  = 102
height = 32


recs = read_csv( "./#{slug}/mint.csv" )
puts "   #{recs.size} record(s)"


## cut down to first hundred
# offset = 100
# recs = recs[offset, 100]

## cut down to first fifty
recs = recs[0, 50]
puts "   #{recs.size} record(s)"


spritesheet_path = "./docs/btcwords/spritesheet.png"


spritesheet = ImageComposite.read( spritesheet_path,
                                      width: width,
                                      height: height )

puts "  #{spritesheet.width}x#{spritesheet.height}"
puts "  #{spritesheet.tile_width}x#{spritesheet.tile_height}"
puts "  #{spritesheet.count}"



composite = ImageComposite.new( 5, 10,  width: width,
                                        height: height )

recs.each_with_index do |rec,i|
  img = Image.new( width, height )
  g = rec['g'].split( ' ' ).map {|v| v.to_i(10) }
  puts "==> no. #{i}   g: #{rec['g']} - #{g.inspect}"
  g.each do |num|
     img.compose!( spritesheet[ num ] )
  end

  img.save( "./tmp/#{slug}#{i}.png" )
  img.zoom(4).save( "./tmp/#{slug}#{i}@4x.png" )

  composite << img
end


outname = "./tmp/#{slug}"

composite.save( "#{outname}.png" )
composite.zoom(4).save( "#{outname}@4x.png" )



puts "bye"

