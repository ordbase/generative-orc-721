require 'pixelart'



base = %w[
  more/base1-orange
  more/base1-orange-orc
  more/base2-orange
  more/base2-orange-orc
  more/base3-orange
  more/base3-orange-orc
  more/base1-green
  more/base1-green-orc
  more/base1-blue
  more/base1-blue-orc
]

eyes = %w[
  eyes
  eyes2
  eyes3
  eyes5
  eyes6
  eyes7
  eyes8
  eyes9
  more/eyemask
  3dglasses
  eyepatch
  lasereyes
  lasereyes2
  more/lasereyes3
  shades
  shades2
  visor
  visor2 
]

##  eyes4


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
   hat2
   hat3
   helmet
   helmet2
   halo
   earring
   more/bubblegum
]

## 1/1s or punks
mores = %w[
  more/base1-punk
  more/lasereyes-punk
]

backgrounds = %w[
 background_bitcoin-orange
 background_bitcoin-pattern
 background_dollar-pattern
 background_euro-pattern
]


names = base + eyes + accessories + mores + backgrounds

puts "  #{names.size} name(s)"
## => 52 name(s)



composite = ImageComposite.new( 10, 6, width: 28,
                                       height: 28 )


names.each do |name|
   path = "./#{name}.png"
   puts "==> reading >#{path}<..."
   img = Image.read( path )
   composite << img
end

composite.save( "./tmp/spritesheet.png" )
composite.zoom(4).save( "./tmp/spritesheet@4x.png" )

puts "bye"