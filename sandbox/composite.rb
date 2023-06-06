require 'pixelart'



# slug = 'diypunks'
slug = 'diycoolcats'


recs = read_csv( "./#{slug}/mint.csv" )
puts "   #{recs.size} record(s)"

## cut down to first hundred
recs = recs[0, 100]


spritesheet = ImageComposite.read( "./#{slug}/spritesheet.png",
                                      width: 24,
                                      height: 24 )

composite = ImageComposite.new( 10, 10, width: 24,
                                        height: 24 )

recs.each_with_index do |rec,i|
  img = Image.new( 24, 24 )
  g = rec['g'].split( ' ' ).map {|v| v.to_i(10) }
  puts "==> no. #{i}   g: #{rec['g']} - #{g.inspect}"
  g.each do |num|
     img.compose!( spritesheet[ num ] )
  end

  composite << img
end

composite.save( "./tmp/#{slug}.png" )
composite.zoom(4).save( "./tmp/#{slug}@4x.png" )



puts "bye"

