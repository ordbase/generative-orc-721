
#####
# begin config settings - change for your collection

# slug = 'diypunks'
# max  = 721              ##  to be done - get "automagically" from deploy inscribe
# name = 'D.I.Y. Punk'
# offset = 0   ## start counting at (offset) 0 or (offset) 1

#  end config settings
###



def generate_inscriptions( slug:, max:, name:,
                            offset: 0  )

  recs = read_csv( "./#{slug}/mint.csv" )
  recs = recs[0, max]    ## cut-off "cursed" overflow "negatives" if any

  puts "   #{recs.size } mint record(s)"

  ## (lookup) mapping (table) ord num to ord id
  mapping = read_csv( "./market/#{slug}_ids.csv" ).reduce( {} ) do |mapping, rec|
                                           mapping[rec['num']] = rec['id']
                                           mapping
                                      end

  ## pp mapping

  data = []
  recs.each_with_index do |rec,i|
    h = {
      'id' => mapping[ rec['num']],
      'meta' => {
         'name' => "#{name} ##{i+offset}",
         'attributes' => [],
      }
    }
   data << h
  end

  data
end
