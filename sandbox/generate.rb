####
#  to run use
#    $ ruby ./sandbox/generate.rb

require 'pixelart'



## step 1 - read (local) spritesheet.png ("art layers")

spritesheet = ImageComposite.read( './no1/spritesheet.png',
                                      width: 24,
                                      height: 24 )


specs = [
  [0],
  [0,23,44],
  [0,38],
  [59,0,38],
  [1,27,38],
  [58,9,28,38],
  [0,15,31,44,54],
  [0,40,43,30],
  [59,0,47,44,29],
]


specs.each do |attributes|
  puts "==> punk #{attributes.inspect}"
  punk = Image.new( 24, 24 )
  attributes.each do |num|
     punk.compose!( spritesheet[ num ] )
  end

  path = "./tmp/punk-#{attributes.join('_')}"
  punk.save( path+'.png' )
  punk.zoom(4).save( path+'@4x.png' )
end


puts "bye"


