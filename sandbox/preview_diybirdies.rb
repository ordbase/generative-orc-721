####
#  to run use
#    $ ruby ./sandbox/preview_diybirdies.rb

require 'pixelart'



## step 1 - read (local) spritesheet.png ("art layers")
diybirdies    = Orc721::Generator.read( './diybirdies/spritesheet.png',
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
]


specs.each do |attributes|
  puts "==> birdie #{attributes.inspect}"
  punk = diybirdies.generate( *attributes )

  path = "./tmp/birdie-#{attributes.join('_')}"
  punk.save( path+'.png' )
  punk.zoom(4).save( path+'@4x.png' )
end


puts "bye"


