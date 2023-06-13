####
#  to run use
#    $ ruby ./sandbox/preview_diyaliens.rb

require 'ordgen'



## step 1 - read (local) spritesheet.png ("art layers")
diyaliens   = Ordgen.read( './docs/diyaliens/spritesheet.png',
                                          width: 24,
                                          height: 24 )


specs = [
  [0],
  [0,4],
 ]

specs.each do |attributes|
  puts "==> alien #{attributes.inspect}"
  punk = diyaliens.generate( *attributes )

  path = "./tmp/alien-#{attributes.join('_')}"
  punk.save( path+'.png' )
  punk.zoom(4).save( path+'@4x.png' )
end


puts "bye"

