require 'pixelart'




slug             = 'diyordibots-v2'
slug_spritesheet = 'diyordibots'
width  = 32
height = 32
max = 999
grid = [40,25]   ## 40 cols x 25 rows = 1000

recs = read_csv( "./#{slug}/mint.csv" )
puts "   #{recs.size} record(s)"

# cut-down to max. limit
recs = recs[0, max]
puts "   #{recs.size} record(s)"



spritesheet_path = if defined?( slug_spritesheet )
                     "./#{slug_spritesheet}/spritesheet.png"
                   else
                     "./#{slug}/spritesheet.png"
                   end

spritesheet = ImageComposite.read( spritesheet_path,
                                      width: width,
                                      height: height )

composite = ImageComposite.new( *grid, width: width,
                                       height: height )

recs.each_with_index do |rec,i|
  img = Image.new( width, height )
  g = rec['g'].split( ' ' ).map {|v| v.to_i(10) }
  puts "==> no. #{i}   g: #{rec['g']} - #{g.inspect}"
  g.each do |num|
     img.compose!( spritesheet[ num ] )
  end

  composite << img
end

outname =  "./tmp/#{slug}_max#{max}"

composite.save( "#{outname}.png" )
composite.zoom(4).save( "#{outname}@4x.png" )



puts "bye"

