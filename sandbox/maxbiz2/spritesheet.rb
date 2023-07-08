require 'pixelart'


composite = ImageComposite.new( 10, 6 )


composite << Image.read( './portrait.png' )
composite << Image.read( './pattern1.png' )
composite << Image.read( './pattern1b.png' )

## add hat (9)
ImageComposite.read( "./04-hat.png" ).each do |img|
    composite << img
end

## add arms (16)
ImageComposite.read( "./02-arms.png" ).each do |img|
    composite << img
end


## add mouth (12)
ImageComposite.read( "./03-mouth.png" ).each do |img|
    composite << img
end


## add eyes (12)
ImageComposite.read( "./05-eyes.png" ).each_with_index do |img,i|
    composite << img   if [0,2,9,10,11].include?(i)
end

## laser eyes
composite << Image.read( './lasereyes-red.png' )
composite << Image.read( './lasereyes-green.png' )
composite << Image.read( './lasereyes-blue.png' )

composite << Image.read( './lasereyes2-red.png' )
composite << Image.read( './lasereyes2-green.png' )
composite << Image.read( './lasereyes2-blue.png' )

composite << Image.read( './noun-red.png' )
composite << Image.read( './noun-green.png' )
composite << Image.read( './noun-blue.png' )




## backgrounds
composite << Image.read( './background-bitcoin-orange.png' )
composite << Image.read( './background-bitcoin-pattern.png' )
composite << Image.read( './background-dollar-pattern.png' )
composite << Image.read( './background-usa.png' )
composite << Image.read( './background-rainbow.png' )
composite << Image.read( './background-ukraine.png' )


composite.save( "./tmp/spritesheet.png" )
composite.zoom(4).save( "./tmp/spritesheet@4x.png" )

puts "bye"

