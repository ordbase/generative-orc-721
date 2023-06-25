####
#  to run use
#    $ ruby preview/diyphunks.rb

require 'ordgen'


## step 1 - read (local) spritesheet.png ("art layers")
diyphunks   = Ordgen.read( './diyphunks/spritesheet.png',
                                          width: 24,
                                          height: 24 )



specs = [
  [5,57,38],
  [4,57,38],

  [59,0,38],
  [58,4,19],
]


specs.each do |attributes|
  puts "==> phunk #{attributes.inspect}"
  punk = diyphunks.generate( *attributes )

  path = "./preview/tmp/phunk-#{attributes.join('_')}"
  punk.save( path+'.png' )
  punk.zoom(4).save( path+'@4x.png' )
end



puts "bye"