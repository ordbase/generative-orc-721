require 'pixelart'



base = %w[
  base1
  base2
  base3
  base4
  base5
  base6
  base7
  base8
  base9
  base10
]

accessories = %w[
   mohawk
   crazyhair
   bandana
   headband
   tiara
   capforward
   knittedcap
   earring
   medicalmask
   cigarette
   pipe
   hoodie
]

more = %w[
  base0
  lasereyes-red
  lasereyes-green
  lasereyes-blue
]


backgrounds = %w[
 background_bitcoin-orange
 background_bitcoin-pattern
 background_dollar-pattern
 background_euro-pattern
]


names = base + accessories + more + backgrounds

puts "  #{names.size} name(s)"
## => 30 name(s)


composite = ImageComposite.new( 10, 3, width: 28,
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