
#####
# begin config settings - change for your collection

# slug = 'diypunks'
# max  = 721              ##  to be done - get "automagically" from deploy inscribe
# name = 'D.I.Y. Punk'
# offset = 0   ## start counting at (offset) 0 or (offset) 1

#  end config settings
###



def generate_page( slug:, max:, name:,
                            offset: 0 )

  recs = read_csv( "./#{slug}/mint.csv" )
  recs = recs[0, max]    ## cut-off "cursed" overflow "negatives" if any

  puts "   #{recs.size } mint record(s)"

  ## (lookup) mapping (table) ord num to ord id
  mapping = read_csv( "./market/#{slug}_ids.csv" ).reduce( {} ) do |mapping, rec|
                                           mapping[rec['num']] = rec['id']
                                           mapping
                                      end

  ## pp mapping

  ## note:  add s for plural now
  title  =   name.end_with?( 's') ? name : "#{name}s"

  buf = <<TXT
## #{title} (#{slug}) max. #{max}

TXT

  recs.each_with_index do |rec,i|

    num = rec['num']
    id = mapping[ num ]

    tooltip = "#{name} ##{i} - № #{num}" 

    buf << %Q[<a href="https://ordinals.com/inscription/#{id}" title="#{tooltip}">]
    buf << %Q[<img src="https://ordbase.github.io/num/#{num}.png" alt="#{tooltip}"></a>]
    buf << "\n"  
  end

buf += <<TXT

---
  
Page Generated with [Ordlite - Ordinal Inscription (SQL) Database - Scripts](https://github.com/ordbase/generative-orc-721/tree/master/ordlite).  
TXT
  

  buf
end

