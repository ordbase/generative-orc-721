require 'pixelart'


base = [
 'orange',
 'gold',
 'cybergreen',
 'deepblue',
 'midnight',
 'magenta',
 'marsred',
]

lasereyes = [
 'lasereyes',
 'lasereyes-gold',
 'lasereyes-blue'
]


composite = ImageComposite.new( 7, 1, width: 24,
                                      height: 24 )

base.each do |name|
   composite << Image.read( "./martians/#{name}.png" )
end

composite.save( "./martians/tmp/martians.png" )
composite.zoom(4).save( "./martians/tmp/martians@4x.png" )




composite = ImageComposite.new( 3, 1, width: 24,
                                      height: 24 )


lasereyes.each do |attr_name|
  composite << Image.read( "./martians/#{attr_name}.png" )
end

composite.save( "./martians/tmp/lasereyes.png" )
composite.zoom(4).save( "./martians/tmp/lasereyes@4x.png" )


composite = ImageComposite.new( 7, 3, width: 24,
                                      height: 24 )


lasereyes.each do |attr_name|
   attr = Image.read( "./martians/#{attr_name}.png")
   base.each do |base_name|
   alien  = Image.read( "./martians/#{base_name}.png" )
      img = Image.new( 24, 24 )
      img.compose!( alien )
      img.compose!( attr  )
      composite << img
   end
end

composite.save( "./martians/tmp/martians-lasereyes.png" )
composite.zoom(4).save( "./martians/tmp/martians-lasereyes@4x.png" )


smile = Image.read( "./martians/smile.png" )

smile.zoom( 4 ).save( "./martians/tmp/smile@4x.png" )
smile.zoom( 8 ).save( "./martians/tmp/smile@8x.png" )


composite = ImageComposite.new( 7, 1, width: 24,
                                      height: 24 )

base.each do |name|
   img = Image.new( 24, 24 )
   img.compose!( Image.read( "./martians/#{name}.png" ))
   img.compose!( smile )

   composite << img
end

composite.save( "./martians/tmp/martians-smile.png" )
composite.zoom(4).save( "./martians/tmp/martians-smile@4x.png" )




noun    = Image.read( "./martians/noun-glasses.png" )
noun_xl = Image.read( "./martians/noun-glasses-big.png" )

noun.zoom( 4 ).save( "./martians/tmp/noun-glasses@4x.png" )
noun.zoom( 8 ).save( "./martians/tmp/noun-glasses@8x.png" )

noun_xl.zoom( 4 ).save( "./martians/tmp/noun-glasses-big@4x.png" )
noun_xl.zoom( 8 ).save( "./martians/tmp/noun-glasses-big@8x.png" )


composite = ImageComposite.new( 2, 1, width: 24,
                                      height: 24 )

composite << noun
composite << noun_xl
composite.save( "./martians/tmp/noun-glasses.png" )
composite.zoom( 4 ).save( "./martians/tmp/noun-glasses@4x.png" )




composite = ImageComposite.new( 7, 2, width: 24,
                                      height: 24 )

base.each do |name|
   img = Image.new( 24, 24 )
   img.compose!( Image.read( "./martians/#{name}.png" ))
   img.compose!( noun )

   composite << img
end

base.each do |name|
   img = Image.new( 24, 24 )
   img.compose!( Image.read( "./martians/#{name}.png" ))
   img.compose!( noun_xl )

   composite << img
end

composite.save( "./martians/tmp/martians-noun.png" )
composite.zoom(4).save( "./martians/tmp/martians-noun@4x.png" )



puts "bye"