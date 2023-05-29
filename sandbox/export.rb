####
#  to run use
#    $ ruby ./sandbox/export.rb

## generate tabular spritesheet.csv
##    input -   spritesheet.png  + meta.csv (for name+category by id)

require 'pixelart'

meta = read_csv( './sandbox/meta.csv' )
puts "   #{meta.size} record(s)"

spritesheet = ImageComposite.read( './no1/spritesheet.png', width: 24, height: 24  )
puts "   #{spritesheet.count} tile(s) in #{spritesheet.tile_width}x#{spritesheet.tile_height}"



meta = meta.sort {|l,r| l['id'].to_i <=> r['id'].to_i }
pp meta



recs = []
pp recs

puts "bye"