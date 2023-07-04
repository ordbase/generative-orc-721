require 'pixelart'


composite = ImageComposite.new( 16, 5, width: 24,
                                       height: 24 )

names = [
    '01-base',
    '02-arms',
    '03-mouth',
    '04-hat',
    '05-eyes',
]                                       

names.each do |name|
   attributes = ImageComposite.read( "./#{name}.png", width: 24, 
                                                     height: 24 )
   attributes.each do |img|
     composite << img 
   end                                              
end

composite.save( "./tmp/spritesheet.png" )
composite.zoom(4).save( "./tmp/spritesheet@4x.png" )

puts "bye"