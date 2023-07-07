#####
#  generate images for mint indexed by inscription ids
##    for ordinals wallet et al
#
#  to run use:
#    $ ruby market/images.rb


require 'ordgen'



## slug = 'diyaliens'
## max  = 100              ##  to be done - get "automagically" from deploy inscribe

## slug = 'diycoolcats'
# slug = 'diycoolcats'
# max  = 721
width = 24
height = 24

## slug = 'diymartians'
## slug = 'diyphunks'
slug = 'diymaxibiz'
max  = 100


recs = read_csv( "./#{slug}/mint.csv" )
## recs = recs[0, max]    ## cut-off "cursed" overflow "negatives" if any

puts "   #{recs.size } mint record(s)"



## (lookup) mapping (table) ord num to ord id
mapping = read_csv( "./market/#{slug}_ids.csv" ).reduce( {} ) do |mapping, rec|
                                         mapping[rec['num']] = rec['id']
                                         mapping
                                    end

## pp mapping


## read (local) spritesheet.png ("art layers")
gen    = Ordgen.read( "./#{slug}/spritesheet.png",
                                        width: width,
                                        height: height )



recs.each_with_index do |rec,i|

   id = mapping[ rec['num']]
   if id.nil?
     puts "!! error - no inscribe num to inscribe id mapping found for:"
     pp rec
     exit 1
   end

   puts "==> #{i} - #{id} ..."

   g = gen._parse( rec['g'] )
   img = gen.generate( *g )

   path = "../ordbase.github.io/content/#{id}.png"
   img.save( path )
end

puts 'bye'
