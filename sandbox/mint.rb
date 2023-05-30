####
#  to run use
#    $ ruby ./sandbox/mint.rb


##
#  mint all generative art for ORC-721 collection
#

require 'pixelart'



recs = read_csv( './sandbox/ordinals.csv' )
puts "   #{recs.size} record(s)"


## step 1 - read (local) spritesheet.png ("art layers")

spritesheet = ImageComposite.read( './no1/spritesheet.png',
                                      width: 24,
                                      height: 24 )



recs.each_with_index do |rec,i|

  id = rec['id']
  data = read_json( "./cache/#{id}.json" )

  attributes = data['g']

  puts "==> #{i+1}/#{recs.size} mint - #{attributes.inspect}..."
  punk = Image.new( 24, 24 )
  attributes.each do |num|
     punk.compose!( spritesheet[ num ] )
  end

  path = "./no1/g/#{attributes.join('_')}"
  punk.save( path+'.png' )
  punk.zoom(4).save( path+'@4x.png' )

  path = "./content/#{id}"
  punk.save( path+'.png' )
  punk.zoom(4).save( path+'@4x.png' )
end





puts "bye"
