require 'pixelart'


punks = ImageComposite.read( './orange/1bitpunks.png',
                                 width: 24,
                                 height: 24 )

puts "  #{punks.size} punk(s)"
#=>  150 punk(s)


BLACK = 0xff  ## e.g. rgba(0,0,0,255) - #000000ff


def pixels_to_numbers( pixels, color: BLACK )
  nums = []
  pixels.each_with_index do |pixel, i|
      nums << i   if pixel == color
  end
  nums
end


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

puts "bye"