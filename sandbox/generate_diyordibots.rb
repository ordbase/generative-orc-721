####
#  to run use
#    $ ruby ./sandbox/generate_diyordibots.rb

require 'pixelart'



## step 1 - read (local) spritesheet.png ("art layers")

spritesheet = ImageComposite.read( './no3/spritesheet.png',
                                      width: 32,
                                      height: 32 )


specs = [
  [1,4,7,21,24],
  [0,5,22,23,11],
 ]


specs.each do |attributes|
  puts "==> bot #{attributes.inspect}"
  punk = Image.new( 32, 32 )
  attributes.each do |num|
     punk.compose!( spritesheet[ num ] )
  end

  path = "./tmp/bot-#{attributes.join('_')}"
  punk.save( path+'bot' )
  punk.zoom(4).save( path+'@4x.png' )
end


puts "bye"


