require 'pixelart'


#######
#   collection (config) setup here ...

# slug = 'diypunks'
slug = 'diypunks-v2'
# slug = 'diycoolcats'
width  = 24
height = 24
max = 721
grid = [30,25]   ## 30 cols x 25 rows = 750

slug_spritesheet = 'diypunks'



###
#  start processing...


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

generator = Orc721::Generator.read( spritesheet_path,
                                       width:  width,
                                       height: height )


composite = ImageComposite.new( *grid, width: width,
                                       height: height )

recs.each_with_index do |rec,i|
  g = generator._parse( rec['g'] )
  puts "==> no. #{i}   g: #{rec['g']} - #{g.inspect}"

  img = generator.generate( *g )

  composite << img
end

outname =  "./tmp/#{slug}_max#{max}"

composite.save( "#{outname}.png" )
composite.zoom(4).save( "#{outname}@4x.png" )



puts "bye"

