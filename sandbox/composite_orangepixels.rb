require 'ordgen'



module Pixelart

class Image

  ## neon glow special effect
  def neon( color, invert: false )

    img = if invert
              change_colors( {
                color => 0,
                0     => color
              })
          else
             self
          end

    ## transparent & white
    inverse1 = img.change_colors( {
                  color => 'ffffff',  ## color to white
               })

    ##  transparent & color
    inverse2 = img
####
# inspired by
#   https://css-tricks.com/how-to-create-neon-text-with-css/
#
# .neonText {
#    color: #fff;
#    text-shadow:
#      // white glow
#       0 0 7px #fff,
#       0 0 10px #fff,
#       0 0 21px #fff,
#      // green glow
#       0 0 42px #0fa,
#       0 0 82px #0fa,
#       0 0 92px #0fa,
#       0 0 102px #0fa,
#       0 0 151px #0fa;

    base = Image.new( width, height, Color::BLACK )
    base.compose!( inverse2.blur( 12 ) )  # -blur 21x21
    base.compose!( inverse2.blur( 6 ) )  # -blur 10x10
    base.compose!( inverse2.blur( 4 ) )   # -blur 7x7

    base.compose!( inverse1.blur( 2 ) )   # -blur 2x2
    base.compose!( inverse1 )
    base
  end
end # class Image
end # module Pixelart





slug = 'orangepixels'
width  = 24
height = 24
max    = 100

recs = read_csv( "./#{slug}/mint.csv" )
puts "   #{recs.size} record(s) - total"

## cut down to first hundred
## recs = recs[0, max]
## puts "   #{recs.size} record(s)"


spritesheet_path =   "./#{slug}/spritesheet.png"

orangepixels  = Ordgen.read( spritesheet_path,
                                       width: width,
                                       height: height )

composite = ImageComposite.new( 10, 10, width: width,
                                        height: height )

composite_neon  = ImageComposite.new( 10, 10, width: width,
                                              height: height )


invert_ids = [5,10,11]

recs.each_with_index do |rec,i|
  g = orangepixels._parse( rec['g'] )
  puts "==> no. #{i}   g: #{rec['g']} - #{g.inspect}"
  img = orangepixels.generate( *g )

  composite << img

  composite_neon << img.neon( 'ff9900', invert: invert_ids.include?( i ) )
end


composite.save( "./tmp2/orangepixels.png" )
composite.zoom(4).save( "./tmp2/orangepixels@4x.png" )


composite_neon.save( "./tmp2/orangepixels_neon.png" )
composite_neon.zoom(4).save( "./tmp2/orangepixels_neon@4x.png" )


puts "bye"

