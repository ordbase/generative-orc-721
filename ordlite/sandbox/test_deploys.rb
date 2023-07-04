####
# to run use:
#   $ ruby -I ./lib sandbox/test_deploys.rb

require 'ordlite'


OrdDb.connect( adapter:  'sqlite3',
               database: './deploy.db' )



puts
puts "  #{Inscribe.count} inscribe(s)"
puts "  #{Blob.count} blob(s)"



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

      ## only add if first deploy
      slug = data['slug']
      if slugs.include?( slug )
         puts "!! WARN - skip deploy >#{slug}< - duplicate; first-come/first-serve"
         next
      end 
      slugs << slug

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





puts "bye"