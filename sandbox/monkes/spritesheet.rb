require 'pixelart'



base = %w[
  base1a-orange
  base1b-orange
  base2a-orange
  base2b-orange
  base3a-orange
  base3b-orange
]

eyes = %w[
  eyes
  eyes2
  eyes3
  eyes4
  3dglasses
  eyepatch
  lasereyes
  shades
  shades2
  visor
]


accessories = %w[
   mohawk
   bandana
   beanie
   cap
   cap2
   cap3
   cap4
   cap5
   cap6
   cap7
   knittedcap
   knittedcap2
   frenchcap
   cowboyhat
   policecap
   tophat
   helmet
   helmet2
   earring
]

## 1/1s
mores = %w[
]

backgrounds = %w[
 background_bitcoin-orange
]




composite = ImageComposite.new( 10, 4, width: 28,
                                       height: 28 )

names = base + eyes + accessories + mores + backgrounds

names.each do |name|
   path = "./#{name}.png"
   puts "==> reading >#{path}<..."
   img = Image.read( path )
   composite << img
end

composite.save( "./tmp/spritesheet.png" )
composite.zoom(4).save( "./tmp/spritesheet@4x.png" )

puts "bye"