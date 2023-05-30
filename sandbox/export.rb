####
#  to run use
#    $ ruby ./sandbox/export.rb

## generate tabular spritesheet.csv
##    input -   spritesheet.png  + meta.csv (for name+category by id)

require 'pixelart'

meta = read_csv( './no1/meta.csv' )
puts "   #{meta.size} record(s)"

spritesheet = ImageComposite.read( './no1/spritesheet.png', width: 24, height: 24  )
puts "   #{spritesheet.count} tile(s) in #{spritesheet.tile_width}x#{spritesheet.tile_height}"



meta = meta.sort {|l,r| l['id'].to_i <=> r['id'].to_i }
pp meta



recs = []

meta.each_with_index do |rec,i|
  puts "==> #{i} - #{rec.inspect}"
  tile = spritesheet[i]
  blob = tile.image.to_blob
  puts "   #{tile.width}x#{tile.height} - #{blob.size} byte(s)"
  base64 = Base64.strict_encode64( blob )

  recs << [rec['name'], rec['category'], base64]
end

pp recs


headers = ['name', 'category', 'base64']
File.open( "./tmp/spritesheet.csv", "w:utf-8" ) do |f|
   f.write( headers.join( ','))
   f.write( "\n")
   recs.each do |values|
     f.write( values.join( ',' ))
     f.write( "\n" )
   end
end


## export to json
data = []
recs.each do |values|
   data << { 'name'     => values[0],
             'category' => values[1],
             'base64'   => values[2] }
end
pp data

write_json( "./tmp/spritesheet.json", data )


puts "bye"