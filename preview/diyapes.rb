####
#  to run use
#    $ ruby preview/diyapes.rb

require 'ordgen'



## step 1 - read (local) spritesheet.png ("art layers")
diyapes  = Ordgen.read( './docs/diyapes/spritesheet.png',
                                          width: 24,
                                          height: 24 )


specs = [
  [0],
  [0,10,14],
  [0,1,20],
 ]

specs.each do |attributes|
  puts "==> ape #{attributes.inspect}"
  punk = diyapes.generate( *attributes )

  path = "./preview/tmp/ape-#{attributes.join('_')}"
  punk.save( path+'.png' )
  punk.zoom(4).save( path+'@4x.png' )
end


puts "bye"

