require 'ordgen'


slug = 'diymartians'
width  = 24
height = 24
max    = 100

recs = read_csv( "./#{slug}/mint.csv" )
puts "   #{recs.size} record(s) - total"

## cut down to first hundred
recs = recs[0, max]
puts "   #{recs.size} record(s)"


spritesheet_path =   "./docs/#{slug}/spritesheet.png"

diymartians  = Ordgen.read( spritesheet_path,
                                       width: width,
                                       height: height )

composite = ImageComposite.new( 10, 10, width: width,
                                        height: height )

recs.each_with_index do |rec,i|
  g = diymartians._parse( rec['g'] )
  puts "==> no. #{i}   g: #{rec['g']} - #{g.inspect}"
  img = diymartians.generate( *g )

  composite << img
end


composite.save( "./tmp2/diymartians.png" )
composite.zoom(4).save( "./tmp2/diymartians@4x.png" )


###############
#  generate NO background version (40-49)

composite = ImageComposite.new( 10, 10, width: width,
                                        height: height )

recs.each_with_index do |rec,i|
  g = diymartians._parse( rec['g'] )
  ## remove backgrounds (40-49)
  g = g.select {|num| num < 40 }
  puts "==> no. #{i}   g: #{rec['g']} - #{g.inspect}"
  img = diymartians.generate( *g )

  composite << img
end


composite.save( "./tmp2/diymartians-remove_background.png" )
composite.zoom(4).save( "./tmp2/diymartians-remove_background@4x.png" )


puts "bye"

