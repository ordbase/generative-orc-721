require 'ordgen'


slug = 'diyaliens'
width  = 24
height = 24
max    = 100

recs = read_csv( "./#{slug}/mint.csv" )
puts "   #{recs.size} record(s) - total"

## cut down to first hundred
recs = recs[0, max]
puts "   #{recs.size} record(s)"


spritesheet_path =   "./docs/#{slug}/spritesheet.png"

diyaliens  = Ordgen.read( spritesheet_path,
                                       width: width,
                                       height: height )

composite = ImageComposite.new( 10, 10, width: width,
                                        height: height )

recs.each_with_index do |rec,i|
  g = diyaliens._parse( rec['g'] )
  puts "==> no. #{i}   g: #{rec['g']} - #{g.inspect}"
  img = diyaliens.generate( *g )

  composite << img
end


composite.save( "./tmp2/diyaliens.png" )
composite.zoom(4).save( "./tmp2/diyaliens@4x.png" )



puts "bye"

