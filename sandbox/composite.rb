require 'pixelart'



# slug = 'diypunks'
# slug = 'diycoolcats'

# slug = 'diyordibots'
# width  = 32
# height = 32

# slug = 'diypunks-v2'
# slug_spritesheet = 'diypunks'
# width  = 24
# height = 24

slug = 'diypunks'
width  = 24
height = 24
offset = 100

recs = read_csv( "./#{slug}/mint.csv" )
puts "   #{recs.size} record(s)"

## cut down to first hundred
recs = recs[offset, 100]


spritesheet_path = if defined?( slug_spritesheet )
                     "./#{slug_spritesheet}/spritesheet.png"
                   else
                     "./#{slug}/spritesheet.png"
                   end

spritesheet = ImageComposite.read( spritesheet_path,
                                      width: width,
                                      height: height )

composite = ImageComposite.new( 10, 10, width: width,
                                        height: height )

recs.each_with_index do |rec,i|
  img = Image.new( width, height )
  g = rec['g'].split( ' ' ).map {|v| v.to_i(10) }
  puts "==> no. #{offset+i}   g: #{rec['g']} - #{g.inspect}"
  g.each do |num|
     img.compose!( spritesheet[ num ] )
  end

  composite << img
end

outname =    if offset > 0
                "./tmp/#{slug}_#{offset}"
             else
                "./tmp/#{slug}"
             end

composite.save( "#{outname}.png" )
composite.zoom(4).save( "#{outname}@4x.png" )



puts "bye"

