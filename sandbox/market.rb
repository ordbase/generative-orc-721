#####
#  generate inscriptions.json dataset
##    for ordinals wallet et al
#
#  to run use:
#    $ ruby sandbox/market.rb


require 'cocos'

slug = 'diypunks'
max  = 721              ##  to be done - get "automagically" from deploy inscribe
name = 'D.I.Y. Punk'
offset = 1   ## start counting at (offset) 0 or (offset) 1


recs = read_csv( "./#{slug}/mint.csv" )
recs = recs[0, max]    ## cut-off "cursed" overflow "negatives" if any

puts "   #{recs.size } mint record(s)"

## (lookup) mapping (table) ord num to ord id
mapping = read_csv( "./sandbox/#{slug}_ids.csv" ).reduce( {} ) do |mapping, rec|
                                         mapping[rec['num']] = rec['id']
                                         mapping
                                    end

## pp mapping


data = []
recs.each_with_index do |rec,i|
    h = {
      'id' => mapping[ rec['num']],
      'meta' => {
         'name' => "#{name} ##{i+1}",
         'attributes' => [],
      }
    }
   data << h
end


write_json( "./sandbox/diypunks_inscriptions.json", data )
# write_text( "./sandbox/inscriptions.json", data.to_json )

puts 'bye'
