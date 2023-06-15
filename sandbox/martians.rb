require 'pixelart'


backgrounds = [
 'bitcoin-orange',
 'bitcoin-pattern',
 'red',
 'green',
 'dollar-pattern',
 'blue',
 'aqua',
 'classic',
 'rainbow',
 'ukraine',
]


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
noun_xl = Image.read( "./martians/noun-glasses_xl.png" )

noun.zoom( 4 ).save( "./martians/tmp/noun-glasses@4x.png" )
noun.zoom( 8 ).save( "./martians/tmp/noun-glasses@8x.png" )

noun_xl.zoom( 4 ).save( "./martians/tmp/noun-glasses_xl@4x.png" )
noun_xl.zoom( 8 ).save( "./martians/tmp/noun-glasses_xl@8x.png" )


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




composite = ImageComposite.new( 10, 1, width: 24,
                                      height: 24 )

backgrounds.each do |name|
   composite << Image.read( "./martians/backgrounds/#{name}.png" )
end

composite.save( "./martians/tmp/backgrounds.png" )
composite.zoom(4).save( "./martians/tmp/backgrounds@4x.png" )


composite = ImageComposite.new( 6, 5, width: 24,
                                      height: 24 )

3.times do |n|
   backgrounds.each_with_index do |name,m|
       img = Image.new( 24, 24 )
       img.compose!( Image.read( "./martians/backgrounds/#{name}.png" ))
       i = n*10+m
       base_name = base[ i % base.size ]
       img.compose!( Image.read( "./martians/#{base_name}.png"))

       row = i / 6

       if row == 2
         lasereyes_name = lasereyes[ i % lasereyes.size ]
         img.compose!( Image.read( "./martians/#{lasereyes_name}.png"))
       end

       img.compose!( smile )   if row == 3


       img.compose!( noun_xl )   if row == 4


       composite << img
   end
end


composite.save( "./martians/tmp/martians-backgrounds.png" )
composite.zoom(4).save( "./martians/tmp/martians-backgrounds@4x.png" )




#####
#

###
## assemble into spritesheet

attributes =
[
  'm/mohawk',
  smile,
  'm/spots',

  'm/bandana',
  'm/headband',
  'm/tophat',
  'm/cowboy_hat',
  'm/cap',
  'm/cap_forward',
  'm/knitted_cap',
  'm/beanie',
  'm/dorag',

  'm/nerd_glasses',
  'm/vr',
  'm/3d_glasses',
  'm/eye_mask',
  'm/regular_shades',
  'm/small_shades',
  'm/horned_rim_glasses',
  'm/eye_patch',

   noun,
   noun_xl,

  'm/earring',
  'm/goldchain',

  'm/pipe',
  'm/cigarette',
  'm/medical_mask',

  'm/hoodie',
]


composite = ImageComposite.new( 10, 5, width: 24,
                                       height: 24 )

base.each do |name|
   composite << Image.read( "./martians/#{name}.png" )
end

attributes.each do |attr|
   img = if attr.is_a?( String )
           Image.read( "./tmp/apes/#{attr}.png" )
         else  ### assume image already
            attr
         end
  composite << img
end

lasereyes.each do |name|
   composite << Image.read( "./martians/#{name}.png" )
 end

composite << Image.new( 24, 24 ) ## place holder 1
composite << Image.new( 24, 24 ) ## place holder 2

backgrounds.each do |name|
   composite << Image.read( "./martians/backgrounds/#{name}.png" )
end


composite.save( "./martians/tmp/spritesheet.png" )
composite.zoom(4).save( "./martians/tmp/spritesheet@4x.png" )
# composite.zoom(8).save( "./martians/tmp/spritesheet@8x.png" )





puts "bye"