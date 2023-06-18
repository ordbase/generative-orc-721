
#####
# begin config settings - change for your collection

# slug = 'diypunks'
# max  = 721              ##  to be done - get "automagically" from deploy inscribe
# name = 'D.I.Y. Punk'
# offset = 0   ## start counting at (offset) 0 or (offset) 1

#  end config settings
###



def generate_inscriptions( slug:, max:, name:,
                            offset: 0,
                            include_images: false,
                            include_attributes: false,
                            include_dna: false  )

  recs = read_csv( "./#{slug}/mint.csv" )
  recs = recs[0, max]    ## cut-off "cursed" overflow "negatives" if any

  puts "   #{recs.size } mint record(s)"

  ## (lookup) mapping (table) ord num to ord id
  mapping = read_csv( "./market/#{slug}_ids.csv" ).reduce( {} ) do |mapping, rec|
                                           mapping[rec['num']] = rec['id']
                                           mapping
                                      end

  ## pp mapping


  meta =  if include_attributes
              read_csv( "./#{slug}/meta.csv" )
          else
             []
          end

  ## note: MUST sort meta records by id!!!
  ##          do NOT assume / expected sorted records!!!!
  meta = meta.sort do |l,r|
                         l['id'].to_i(10) <=> r['id'].to_i(10)
                   end


  data = []
  recs.each_with_index do |rec,i|

    id = mapping[ rec['num']]

    h = {
      'id' => id,
      'meta' => {
         'name' => "#{name} ##{i+offset}",
      }
    }

    if include_attributes
        attributes = []

        ## for delimiter allow for now:  - why? why not?
        ##     (multiple) space ( )
        ##      command or semicolon
        g  =  rec['g'].strip.split( %r{[ ,;/_-]+} ).map {|v| v.to_i(10) }
        g.each do |value|
           attribute  = meta[value]
           if attribute.nil?
              puts "!! ERROR - no meta record found g no. #{value}; sorry"
              exit 1
           end
           attributes << { 'trait_type' => attribute['category'],
                           'value'      => "#{value} - #{attribute['name']}" }
        end

        if include_dna
          attributes <<  { 'trait_type' => 'DNA',
                           'value'      => g.join( ' ' ) }
        end

        h['meta']['attributes'] = attributes
    end

    h['meta']['high_res_img_url'] = "https://ordbase.github.io/content/#{id}.png"  if include_images

   data << h
  end

  data
end

