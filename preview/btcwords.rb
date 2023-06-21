####
#  to run use
#    $ ruby preview/btcwords.rb

require 'ordgen'


## step 1 - read (local) spritesheet.png ("art layers")
btcwords   = Ordgen.read( './btcwords/spritesheet.png',
                                          width: 102,
                                          height: 32 )


specs = [
  [0,53,58,98,110,153],
  [0,53,58,100,115,153],
 ]

specs.each do |attributes|
  puts "==> btcword #{attributes.inspect}"
  img = btcwords.generate( *attributes )

  path = "./preview/tmp/btcword-#{attributes.join('_')}"
  img.save( path+'.png' )
  img.zoom(4).save( path+'@4x.png' )
end


puts "bye"

