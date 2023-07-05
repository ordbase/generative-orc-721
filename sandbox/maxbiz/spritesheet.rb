require 'pixelart'


##
## for r/g/b use
##  red       #EB0208
#  green     #1F882B
#  blue      #1C37EA



base = %w[
  punk1
  punk1b
  marc1b
  ape1b
  demon1
  demon1b
  frankenstein1
  frankenstein1b
  orc1
  orc1b
  alien1
  alien1b 
  robot1
  robot1b
]

patterns = %w[
  punk2
  punk2b
  punk2c  
  pattern2
  pattern2b
  pattern1
  pattern1b
]

eyes = %w[
  face
 
  m/smile
  m/frown
  m/spots
  bigbeard

  lasereyes
  lasereyes-red
  lasereyes-green
  lasereyes-blue
  lasereyes2
  lasereyes2-red
  lasereyes2-green
  lasereyes2-blue
 
  noun-red
  noun-green
  noun-blue

  m/smallshades
  m/regularshades
  m/hearteyes
  m/3dglasses
  m/vr
]


accessories = %w[
  m/crazyhair
  m/frumpyhair
  m/messyhair
  m/mohawk
  m/peakspike


  m/bandana
  m/beanie
  m/cap
  m/capforward
  m/cowboyhat
  m/fedora
  m/headband
  m/knittedcap
  m/tophat
  
  m/bubblegum
  m/cigarette
  m/pipe
  m/medicalmask

  m/bearhood
  m/hoodie
]

backgrounds = %w[
 background-bitcoin-orange
 background-bitcoin-pattern
 background-red
 background-green
 background-dollar-pattern
 background-blue
 background-rainbow
 background-ukraine 
]



composite = ImageComposite.new( 10, 7, width: 24,
                                       height: 24 )

names = base + patterns + eyes + accessories +  backgrounds

names.each do |name|
   path = "./#{name}.png"
   puts "==> reading >#{path}<..."
   img = Image.read( path )
   composite << img                                               
end

composite.save( "./tmp/spritesheet.png" )
composite.zoom(4).save( "./tmp/spritesheet@4x.png" )

puts "bye"