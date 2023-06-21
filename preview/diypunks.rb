####
#  to run use
#    $ ruby preview/diypunks.rb

require 'ordgen'


## step 1 - read (local) spritesheet.png ("art layers")
diypunks   = Ordgen.read( './diypunks/spritesheet.png',
                                          width: 24,
                                          height: 24 )



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
  punk = diypunks.generate( *attributes )

  path = "./preview/tmp/punk-#{attributes.join('_')}"
  punk.save( path+'.png' )
  punk.zoom(4).save( path+'@4x.png' )
end



puts "bye"