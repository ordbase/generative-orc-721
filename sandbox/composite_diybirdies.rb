require 'ordgen'


#######
#   collection (config) setup here ...

slug = 'diybirdies'
width  = 24
height = 24
max = 721
grid = [30,25]   ## 30 cols x 25 rows = 750

###
#  start processing...
recs = read_csv( "./#{slug}/mint.csv" )
puts "   #{recs.size} record(s)"

# cut-down to max. limit
# recs = recs[0, max]
# puts "   #{recs.size} record(s)"


diybirdies = Ordgen.read( "./#{slug}/spritesheet.png",
                             width:  width,
                             height: height )


composite = ImageComposite.new( *grid, width: width,
                                       height: height )

recs.each_with_index do |rec,i|
  g = diybirdies._parse( rec['g'] )
  puts "==> no. #{i}   g: #{rec['g']} - #{g.inspect}"

  composite << diybirdies.generate( *g )
end


outname =  "./tmp/#{slug}_max#{max}"

composite.save( "#{outname}.png" )
composite.zoom(4).save( "#{outname}@4x.png" )



puts "bye"

