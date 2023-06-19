####
#  to run use
#    $ ruby ./sandbox/preview_diymartians.rb

require 'ordgen'



## step 1 - read (local) spritesheet.png ("art layers")
diymartians   = Ordgen.read( './docs/diymartians/spritesheet.png',
                                          width: 24,
                                          height: 24 )


specs = [
  [0,31,39,36],
  [44,1,10,23],
  [2,7,18,25,29,37,44],
  [1,32,35,34,39,9],
 ]

specs.each do |attributes|
  puts "==> martian #{attributes.inspect}"
  punk = diymartians.generate( *attributes )

  path = "./tmp/martian-#{attributes.join('_')}"
  punk.save( path+'.png' )
  punk.zoom(4).save( path+'@4x.png' )
end


puts "bye"

