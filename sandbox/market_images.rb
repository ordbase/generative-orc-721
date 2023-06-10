#####
#  generate images for mint indexed by inscription ids
##    for ordinals wallet et al
#
#  to run use:
#    $ ruby sandbox/market_images.rb


require 'pixelart'


max  = 721              ##  to be done - get "automagically" from deploy inscribe

recs = read_csv( "./diypunks/mint.csv" )
recs = recs[0, max]    ## cut-off "cursed" overflow "negatives" if any

puts "   #{recs.size } mint record(s)"

## (lookup) mapping (table) ord num to ord id
mapping = read_csv( "./sandbox/diypunks_ids.csv" ).reduce( {} ) do |mapping, rec|
                                         mapping[rec['num']] = rec['id']
                                         mapping
                                    end

## pp mapping


## read (local) spritesheet.png ("art layers")
diypunks    = Orc721::Generator.read( './diypunks/spritesheet.png',
                                        width: 24,
                                        height: 24 )



recs.each_with_index do |rec,i|

   id = mapping[ rec['num']]
   if id.nil?
     puts "!! error - no inscribe num to inscribe id mapping found for:"
     pp rec
     exit 1
   end

   puts "==> #{i} - #{id} ..."

   g = diypunks._parse( rec['g'] )
   img = diypunks.generate( *g )

   path = "../ordbase.github.io/content/#{id}.png"
   img.save( path )
end

puts 'bye'
