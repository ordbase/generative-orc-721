require 'pixelart'



base = %w[
  base1a-orange
  base1b-orange
  base2a-orange
  base2b-orange
  base3a-orange
  base3b-orange
  base1-orc
  base2-orc
]

eyes = %w[
  eyes
  eyes2
  eyes3
  eyes4
  more/eyemask
  3dglasses
  eyepatch
  lasereyes
  lasereyes2
  shades
  shades2
  visor 
]


accessories = %w[
   mohawk
   more/mohawk-red
   bandana
   beanie
   more/jesterhat
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
   hat
   helmet
   helmet2
   earring
   more/bubblegum
]

## 1/1s or punks
mores = %w[
  base1-punk
  more/lasereyes-punk
]

backgrounds = %w[
 background_bitcoin-orange
 background_bitcoin-pattern
 background_dollar-pattern
 background_euro-pattern
]




composite = ImageComposite.new( 10, 5, width: 28,
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