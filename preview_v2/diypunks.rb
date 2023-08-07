####
#  to run use
#    $ ruby preview_v2/diypunks.rb


$LOAD_PATH.unshift( "../ordbase/ordinals/lib" )
$LOAD_PATH.unshift( "../ordbase/ordlite/lib" )
require 'ordlite'


OrdDb.open( './ord.db' )


## step 1 - read database "factory" record, that is, ordgen / ORC-721 deploy inscribe 
rec = Factory.find( 'diypunks' )

puts "==> #{rec.id} >#{rec.name}< max. #{rec.max} - #{rec.dim} - inscribe no. #{rec.inscribe.num} - #{rec.inscribe.date}"
 
puts "   #{rec.layers.count} layer(s):"

generator = rec.generator
puts "      #{generator.count} tile(s)"




specs = [
  [0],
  [0,23,44],
  [0,38],
  [59,0,38],
  [1,27,38],
  [58,9,28,38],
  [0,15,31,44,54],
  [0,40,43,30],
  [59,0,47,44,29],

  ## preview asked for
  [5,10],
  [0,26,38,41],
  [8,11,57],
  [8,57,11],
  [5,27,38,55,57],
  [5,27,57,38,55],
  [5,57,38,55],

  [59,5,21,38,48,55],
  [59,5,21,38,55],
  [59,5,38,48,55],

  [1, 34, 42, 48],


  [6, 35, 54, 55],
  [6, 37, 54, 55],


  [59, 5, 26, 38, 43],

  [4,17,36,51],
  [59, 4, 26, 37, 44, 55, 57],

  # konf..
  [1,34,42,48],
  [5,34,42,48],

  # more
  [58,4,19],
]


specs.each do |attributes|
  puts "==> punk #{attributes.inspect}"
  punk = generator.generate( *attributes )

  path = "./preview_v2/tmp/punk-#{attributes.join('_')}"
  punk.save( path+'.png' )
  punk.zoom(4).save( path+'@4x.png' )
end



puts "bye"