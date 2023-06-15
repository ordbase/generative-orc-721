require 'ordgen'


#######
#   collection (config) setup here ...

max = 721

###
#  start processing...
recs = read_csv( "./diycoolcats/mint.csv" )
puts "   #{recs.size} record(s)"

# cut-down to max. limit
recs = recs[0, max]
puts "   #{recs.size} record(s)"


diycoolcats = Ordgen.read( "./diycoolcats/spritesheet.png",
                             width:  24,
                             height: 24 )

## 30 cols x 25 rows = 750
composite = ImageComposite.new( 30,25, width: diycoolcats.width,
                                       height: diycoolcats.height )

recs.each_with_index do |rec,i|
  g = diycoolcats._parse( rec['g'] )
  puts "==> no. #{i}   g: #{rec['g']} - #{g.inspect}"

  composite << diycoolcats.generate( *g )
end


outname =  "./tmp2/diycoolcats_max#{max}"

composite.save( "#{outname}.png" )
composite.zoom(4).save( "#{outname}@4x.png" )


puts "bye"

