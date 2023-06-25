require 'ordgen'


slug = 'diyphunks'
width  = 24
height = 24
max    = 100

recs = read_csv( "./#{slug}/mint.csv" )
puts "   #{recs.size} record(s) - total"

## cut down to first hundred
## recs = recs[0, max]
## puts "   #{recs.size} record(s)"


spritesheet_path =   "./#{slug}/spritesheet.png"

diyphunks  = Ordgen.read( spritesheet_path,
                                       width: width,
                                       height: height )

composite = ImageComposite.new( 10, 10, width: width,
                                        height: height )

recs.each_with_index do |rec,i|
  g = diyphunks._parse( rec['g'] )
  puts "==> no. #{i}   g: #{rec['g']} - #{g.inspect}"
  img = diyphunks.generate( *g )

  composite << img
end


composite.save( "./tmp2/diyphunks.png" )
composite.zoom(4).save( "./tmp2/diyphunks@4x.png" )



puts "bye"

