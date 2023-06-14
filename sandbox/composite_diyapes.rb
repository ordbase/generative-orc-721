require 'ordgen'


slug = 'diyapes'
width  = 24
height = 24


recs = read_csv( "./#{slug}/mint.csv" )
puts "   #{recs.size} record(s) - total"

## cut down to first hundred
# recs = recs[offset, 100]
# puts "   #{recs.size} record(s)"


spritesheet_path =   "./docs/#{slug}/spritesheet.png"

diyapes  = Ordgen.read( spritesheet_path,
                                       width: width,
                                       height: height )

composite = ImageComposite.new( 10, 10, width: width,
                                        height: height )

recs.each_with_index do |rec,i|
  g = diyapes._parse( rec['g'] )
  puts "==> no. #{i}   g: #{rec['g']} - #{g.inspect}"
  img = diyapes.generate( *g )

  composite << img
end


composite.save( "./tmp2/diyapes.png" )
composite.zoom(4).save( "./tmp2/diyapes@4x.png" )



puts "bye"

