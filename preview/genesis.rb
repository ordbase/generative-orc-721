####
#  to run use
#    $ ruby preview/genesis.rb

require 'ordgen'


## step 1 - read (local) spritesheet.png ("art layers")
genesis   = Ordgen.read( './docs/genesis/spritesheet.png',
                                          width: 24,
                                          height: 24 )



specs = [
  [0, 11, 61, 50, 34, 12, 19],
]


specs.each do |attributes|
  puts "==> punk #{attributes.inspect}"
  punk = genesis.generate( *attributes )

  path = "./preview/tmp/genesis-#{attributes.join('_')}"
  punk.save( path+'.png' )
  punk.zoom(4).save( path+'@4x.png' )
end



puts "bye"