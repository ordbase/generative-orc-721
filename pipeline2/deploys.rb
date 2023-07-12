####
# to run use:
#   $ ruby pipeline2/deploys.rb

$LOAD_PATH.unshift( "./ordlite/lib" )
require 'ordlite'


OrdDb.connect( adapter:  'sqlite3',
               database: './ord.db' )



puts
puts "  #{Inscribe.count} inscribe(s)"
puts "  #{Blob.count} blob(s)"
puts "  #{Collection.count} collections(s)"
puts "  #{Generative.count} generative(s)"



## note: for now delete all collection
# Collection.delete_all
# puts "  #{Collection.count} collections(s)"


####################
## query for deploy candidates


deploys = Inscribe.deploys
puts "   #{deploys.size} deploy candidate(s)"


slugs = []

deploys.each_with_index do |rec,i|
    puts "==> deploy #{i} - num #{rec.num} - #{rec.bytes} bytes - #{rec.date}"
    puts rec.content 

    ## try to auto-fill / add collections
    text = rec.content.strip


    data = nil  ## first see if valid json
    ## check if text or json format
    if OG.is_deploy?( text )
      data = OG.parse_deploy( text )  
    else  ## assume json
      begin
        data = JSON.parse( text )
      rescue JSON::ParserError => ex
        ## keep going
        puts "!! WARN - skip deploy - json parse error"
        next
      end
    end

    ## note: auto-exclude / skip for now
    next if [
               14935406  ### broken first diymaxibiz deploy
            ].include?( rec.num )


      ## only add if first deploy
      slug = data['slug']
      if slugs.include?( slug )
         puts "!! WARN - skip deploy >#{slug}< - duplicate; first-come/first-serve"
         next
      end 
      slugs << slug

      ## check if present
      col = Collection.find_by( id: slug )
      if col
        # skip - already in database
      else
        ## insert new collection (& generatives!)
        name = data['name']
        max = data['max']
        dim = data['dim']
        generative = data['generative']
        generative = [generative]  if generative.is_a?( String )
        puts "  #{generative.size} layer(s):"
        pp generative

        col = Collection.create( id: slug,
                                 inscribe_id: rec.id, 
                                 name: name,
                                 max: max,
                                 dim: dim )
        generative.each_with_index do |id,i|
            inscribe = Inscribe.find( id )
            col.inscriberefs.create( pos: i, 
                                  inscribe_id: inscribe.id )
       end
     end
end





puts "bye"