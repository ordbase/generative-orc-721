####
#  to run use
#    $ ruby preview/diymaxibiz.rb

require 'ordgen'


## step 1 - read (local) spritesheet.png ("art layers")
diymaxibiz   = Ordgen.read( './diymaxibiz/spritesheet.png',
                                          width: 24,
                                          height: 24 )



specs = [
  [83,72],
]


specs.each do |attributes|
  puts "==> maxibiz #{attributes.inspect}"
  punk = diymaxibiz.generate( *attributes )

  path = "./preview/tmp/maxibiz-#{attributes.join('_')}"
  punk.save( path+'.png' )
  punk.zoom(4).save( path+'@4x.png' )
end



puts "bye"