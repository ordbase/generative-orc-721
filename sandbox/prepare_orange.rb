require 'pixelart'


module Pixelart
  class Image
    def blackout( color='#ffffff' )
      color = Color.parse( color )

      img = Image.new( @img.width, @img.height )

      @img.width.times do |x|
        @img.height.times do |y|
          pixel = @img[x,y]

          img[x,y] = if [color, Color::TRANSPARENT].include?( pixel )    # transparent (0)
                         color ## change transparent to background color
                     else
                         0x000000ff  ## black - r/g/b/a (0,0,0,255)
                     end
      end
    end
    img
  end
  end  # class Image
  end # module Pixelart



BLACK  = 0xff         ## e.g. rgba(0,0,0,255) - #000000ff

def pixels_to_numbers( pixels, colors: [BLACK] )
  nums = []
  pixels.each_with_index do |pixel, i|
      nums << i   if colors.include?( pixel )
  end
  nums
end


##
## blackout
['monkey1',
 'monkey2',
 'monkey3',
 'monkey4',
 'monkey5',
 'monkey6',
 ].each do |name|

   puts "==> #{name}..."

   img = Image.read( "./orange2/tmp/#{name}.png" )
   img = img.blackout

   img.save( "./orange2/#{name}.png" )
   orange = img.change_colors( { 0xff => 0xff9900ff,
                                 0xffffffff => 0, } )
   orange.save( "./orange2/tmp/orange-#{name}.png" )
   orange.zoom(4).save( "./orange2/tmp/orange-#{name}@4x.png" )
   orange.zoom(8).save( "./orange2/tmp/orange-#{name}@8x.png" )

   puts
   p pixels_to_numbers( img.pixels )
   puts
end





__END__

##
## blackout
['cat1',
 'coffee',
 'knight1',
 'knight2',
 'opunk1',
 'punk',
 'shibainu1',
 'shibainu2',
 'smile',
].each do |name|

   img = Image.read( "./orange/tmp/#{name}.png" )
   img = img.blackout

   img.save( "./orange/#{name}.png" )
   img.zoom(8).save( "./orange/tmp/#{name}@8x.png" )
end




## split money series into 1/1s
##  change to all white & black!


composite = ImageComposite.read( './orange/tmp/money.png',
                                 width: 24,
                                 height: 24 )

puts "  #{composite.size} tiles(s)"
#=>  150 punk(s)

composite.size.times do |i|
  puts "==> #{i+1} ..."
  tile = composite[i]

  ## convert all non-white to black
  colors = tile.pixels.uniq
  pp colors

  tile = tile.blackout
  puts "  blackout:"
  colors = tile.pixels.uniq
  pp colors

  tile.save( "./orange/money#{i+1}.png" )
  tile.zoom(8).save( "./orange/tmp/money#{i+1}8x.png" )
end


num = 0
[1,2,3].each do |vol|
  composite = ImageComposite.read( "./orange/tmp/animals#{vol}-18x18.png",
                                 width: 18,
                                 height: 18 )

puts "  #{composite.size} tiles(s)"
#=>  150 punk(s)


composite.size.times do |i|
  puts "==> #{num+1} ..."
  tile = composite[i]

  ## convert all non-white to black
  colors = tile.pixels.uniq
  pp colors

  tile = tile.blackout
  puts "  blackout:"
  colors = tile.pixels.uniq
  pp colors

  frame = Image.new( 24, 24, 0xffffffff )
  frame.compose!( tile, 3, 4 )

  frame.save( "./orange/animal#{num+1}.png" )
  frame.zoom(8).save( "./orange/tmp/animal#{num+1}@8x.png" )

  num += 1
end
end





puts "bye"