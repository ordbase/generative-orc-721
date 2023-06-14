
#####
# begin config settings - change for your collection

# slug = 'diypunks'
# max  = 721              ##  to be done - get "automagically" from deploy inscribe
# name = 'D.I.Y. Punk'
# offset = 0   ## start counting at (offset) 0 or (offset) 1

#  end config settings
###



def generate_inscriptions( slug:, max:, name:,
                            offset: 0, include_images: false  )

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

    id = mapping[ rec['num']]

    h = {
      'id' => id,
      'meta' => {
         'name' => "#{name} ##{i+offset}",
      }
    }

    h['meta']['high_res_img_url'] = "https://ordbase.github.io/content/#{id}.png"  if include_images


   data << h
  end

  data
end



__END__

### example from recursive punks  inscriptions.json  ...

{
    "id": "e7676a95cb0dab3058edff0371a095685b998213cebaeea0a17e2c16e973eb9ei0",
    "meta": {
      "name": "Recursive Punk #0",
      "high_res_img_url": "https://raw.githubusercontent.com/RecursivePunks/RecursivePunks/main/highres/0.png"
    }
  },