####
#  to run use
#    $ ruby ./sandbox/preview_diybirdies.rb

require 'ordgen'



## step 1 - read (local) spritesheet.png ("art layers")
diybirdies    = Ordgen.read( './diybirdies/spritesheet.png',
                                        width: 24,
                                        height: 24 )


specs = [
   [92, 162, 107],
   [91, 141, 102, 207],
   [17, 178, 145, 106],

   ## more
   [91, 205, 126],
   [16, 147, 205],
   [13, 100, 126, 192],

   [22, 124, 96, 192, 209],

   ## more
    [13, 127, 177, 196, 100, 200],
    [49, 191, 129, 167, 98, 215, 197],
    [82, 208, 131, 94, 171, 209, 187],
]


specs.each do |attributes|
  puts "==> birdie #{attributes.inspect}"
  punk = diybirdies.generate( *attributes )

  path = "./tmp/birdie-#{attributes.join('_')}"
  punk.save( path+'.png' )
  punk.zoom(4).save( path+'@4x.png' )
end


puts "bye"


