####
#  to run use
#    $ ruby preview/diyordibots.rb

require 'ordgen'



## step 1 - read (local) spritesheet.png ("art layers")
diyordibots   = Ordgen.read( './diyordibots/spritesheet.png',
                                          width: 32,
                                          height: 32 )



specs = [
  [1,4,7,21,24],
  [0,5,22,23,11],

  [2,5,16,23,9],

  [3,6,9,17,26],
  [2,4,16,23,9],

  [0,3,16,25,14],
 ]

specs.each do |attributes|
  puts "==> bot #{attributes.inspect}"
  punk = diyordibots.generate( *attributes )

  path = "./preview/tmp/bot-#{attributes.join('_')}"
  punk.save( path+'.png' )
  punk.zoom(4).save( path+'@4x.png' )
end


puts "bye"