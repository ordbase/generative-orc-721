require 'pixelart'




BLACK  = 0xff         ## e.g. rgba(0,0,0,255) - #000000ff
ORANGE = 0xff9900ff


def pixels_to_numbers( pixels, colors: [BLACK] )
  nums = []
  pixels.each_with_index do |pixel, i|
      nums << i   if colors.include?( pixel )
  end
  nums
end



####
## convert 150 punks (1-bit black & white)
punks = ImageComposite.read( './orange/1bitpunks.png',
                                 width: 24,
                                 height: 24 )

puts "  #{punks.size} punk(s)"
#=>  150 punk(s)




buf = ""

punks.size.times do |i|
  img = punks[i]
  pixels = img.pixels
  colors = pixels.uniq.size
  puts "==>  num #{i}   #{img.width}x#{img.height}  #{colors} color(s)..."
  nums = pixels_to_numbers( pixels )
  puts "    #{nums.size} / #{pixels.size}  pixels"

  ## add
  buf +=<<TXT
`
######
#  punk no. #{i+1}  - #{nums.size} / #{pixels.size} pixels
#{nums.join( ' ')}
`,
TXT


end


puts buf

write_text( "./tmp2/designs-punks.js", buf )



####
#  convert starter images


## downsample  8x back to 1x !!
steps_96px_to_24px = Image.calc_sample_steps( 24*8, 24 )

starters = {
  'ordinal punk no. 1'  => Image.read( "./orange/punk01_bw.png" ),
  'smile face'  =>  Image.read( "./orange/smile@8x.png" ).sample( steps_96px_to_24px ),
  'orangepix'  =>  Image.read( "./orange/orangepix1@8x.png" ).sample( steps_96px_to_24px ),

}


buf = ""

starters.each_with_index do |(name, img), i|
  pixels = img.pixels
  colors = pixels.uniq.size
  puts "==>  num #{i}   #{img.width}x#{img.height}  #{colors} color(s)..."
  nums = pixels_to_numbers( pixels, colors: [BLACK, ORANGE] )
  puts "    #{nums.size} / #{pixels.size}  pixels"

  ## add
  buf +=<<TXT
`
######
#  #{name}  - #{nums.size} / #{pixels.size} pixels
#{nums.join( ' ')}
`,
TXT


  img.zoom(8).save( "./tmp2/design#{i}@8x.png" )
end


write_text( "./tmp2/designs.js", buf )


puts "bye"