require 'pixelart'




slug = 'diypunks'
width  = 24
height = 24
max = 721
grid = [30,25]   ## 30 cols x 25 rows = 750


recs = read_csv( "./#{slug}/mint.csv" )
puts "   #{recs.size} record(s)"

## cut down to first hundred
recs = recs[0, 721]
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

