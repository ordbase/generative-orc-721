####
# to run use:
#   $ ruby -I ./lib sandbox/test_mints.rb

require 'ordlite'


OrdDb.connect( adapter:  'sqlite3',
               database: './deploy.db' )



## OrdDb::AddGeneratives.new.up

puts
puts "  #{Inscribe.count} inscribe(s)"
puts "  #{Blob.count} blob(s)"
puts "  #{Collection.count} collection(s)"
puts "  #{Generative.count} generative(s)"





#######################
## query for mint candidates

mints = Inscribe.mints
puts "   #{mints.size} mint candidate(s)"

mints.each_with_index do |rec,i|
    puts "==> mint #{i} - num #{rec.num} - #{rec.bytes} bytes - #{rec.date}"
    puts rec.content 

    ## skip processing if alreay in db
    next if Generative.find_by( id: rec.id )  


    ## try to auto-fill / add collections
    text = rec.content.strip

    data = nil  ## first see if valid json
    ## check if text or json format
    if OG.is_mint?( text )
      data = OG.parse_mint( text )  
    else  ## assume json
      begin
        data = JSON.parse( text )
      rescue JSON::ParserError => ex
        ## keep going
        puts "!! WARN - skip mint - json parse error"
        next
      end
    end

    pp data
    slug = data['s']
  
    collection = Collection.find_by( id: slug )
    if collection
      if data['g']
        gen = Generative.create( id: rec.id, 
                                 collection_id: collection.id,
                                 g:  data['g'].join( ' ' ) )
        pp gen
      else
        puts "!! WARN - g(enerative) numbers not found"
      end
    else
       puts "!! WARN - collection >#{slug}< not found"
    end
end


puts
puts "  #{Inscribe.count} inscribe(s)"
puts "  #{Blob.count} blob(s)"
puts "  #{Collection.count} collection(s)"
puts "  #{Generative.count} generative(s)"



puts "bye"