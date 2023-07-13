require 'pixelart'



base = %w[
  maxibiz/base1a
  maxibiz/base1
  maxibiz/base2a
  maxibiz/base2
]

eyes = %w[
  maxibiz/eyes
  maxibiz/eyes2
  maxibiz/shades
  maxibiz/3dglasses
  maxibiz/lasereyes-red
  maxibiz/lasereyes-green
  maxibiz/lasereyes-blue
  maxibiz/lasereyes2-red
  maxibiz/lasereyes2-green
  maxibiz/lasereyes2-blue
]


accessories = %w[
   maxibiz/mohawk
   maxibiz/bandana
   maxibiz/cap2
   maxibiz/cap4
   maxibiz/cap7
   maxibiz/cowboyhat
   maxibiz/tophat
   maxibiz/bubblegum
]

## 1/1s or punks
mores = %w[
  maxibiz/base1a-punk
  maxibiz/base1-punk
]

backgrounds = %w[
 background_bitcoin-orange
 background_bitcoin-pattern
 background_dollar-pattern
 background_euro-pattern
]




composite = ImageComposite.new( 10, 3, width: 28,
                                       height: 28 )

names = base + eyes + accessories + mores + backgrounds

names.each do |name|
   path = "./#{name}.png"
   puts "==> reading >#{path}<..."
   img = Image.read( path )
   composite << img
end

composite.save( "./tmp/spritesheet-maxibiz.png" )
composite.zoom(4).save( "./tmp/spritesheet-maxibiz@4x.png" )

puts "bye"