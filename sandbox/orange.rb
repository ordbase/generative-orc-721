require 'pixelart'




BLACK  = 0xff         ## e.g. rgba(0,0,0,255) - #000000ff


def pixels_to_numbers( pixels, colors: [BLACK] )
  nums = []
  pixels.each_with_index do |pixel, i|
      nums << i   if colors.include?( pixel )
  end
  nums
end


def image_to_ascii( img, colors: [BLACK] )
  buf = ""
  img.height.times do |y|
    img.width.times do |x|
      pixel = img[x,y]

      char = colors.include?( pixel ) ? '@' : '.'
      buf << "#{char} "   ## note: add extra (white)space
    end
    buf << "\n"
  end
  buf
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

  ## nums = pixels_to_numbers( pixels )
  ## puts "    #{nums.size} / #{pixels.size}  pixels"
  ascii = image_to_ascii( img )

  ## add
  buf +=<<TXT
`
######
#  punk no. #{i+1}  - #{img.width}x#{img.height} px
#{ascii}
`,
TXT


end


puts buf

write_text( "./tmp2/designs-punks.js", buf )



####
#  convert starter images


starters = {
  'ordinal punk no. 1'  => Image.read( "./orange/opunk1.png" ),
  'smile face'  =>  Image.read( "./orange/smile.png" ),
  'punk'  =>  Image.read( "./orange/punk.png" ),
}


['cat1',
 'coffee',
 'knight1',
 'knight2',
 'shibainu1',
 'shibainu2',
].each do |name|
   starters[ name ] = Image.read( "./orange/#{name}.png" )
end

9.times do |num|
  name = "money#{num+1}"
  starters[ name ] = Image.read( "./orange/#{name}.png" )
end

27.times do |num|
  name = "animal#{num+1}"
  starters[ name ] = Image.read( "./orange/#{name}.png" )
end


buf = ""

starters.each_with_index do |(name, img), i|
  pixels = img.pixels
  colors = pixels.uniq.size
  puts "==>  num #{i}   #{img.width}x#{img.height}  #{colors} color(s)..."
  # nums = pixels_to_numbers( pixels )
  # puts "    #{nums.size} / #{pixels.size}  pixels"

  ascii = image_to_ascii( img )
  ## add
  buf +=<<TXT
`
######
#  #{name}  - #{img.width}x#{img.height} px
#{ascii}
`,
TXT


  img.zoom(8).save( "./tmp2/design#{i}@8x.png" )
end


write_text( "./tmp2/designs.js", buf )


####
## dump numbers
p pixels_to_numbers( Image.read( "./orange/opunk1.png" ).pixels )
puts
p pixels_to_numbers( Image.read( "./orange/smile.png" ).pixels )
puts


puts "bye"