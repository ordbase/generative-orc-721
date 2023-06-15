require 'pixelart'


base = [
 'marsred',
 'orange',
 'gold',
 'cybergreen',
 'deepblue',
 'midnight',
 'magenta',
]


composite = ImageComposite.new( 7, 1, width: 24,
                                      height: 24 )

base.each do |name|
   img  = Image.read( "./martians/#{name}.png" )
   composite << img
end

composite.save( "./martians/tmp/martians.png" )
composite.zoom(4).save( "./martians/tmp/martians@4x.png" )


puts "bye"