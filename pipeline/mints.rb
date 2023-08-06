####
# to run use:
#   $ ruby pipeline/mints.rb


$LOAD_PATH.unshift( "../ordbase/ordinals/lib" )
$LOAD_PATH.unshift( "../ordbase/ordlite/lib" )
require 'ordlite'


require_relative 'config'
require_relative 'validate'
require_relative 'og'

OrdDb.open( './ord.db' )


puts
puts "  #{Inscribe.count} inscribe(s)"
puts "  #{Blob.count} blob(s)"
puts "  #{Collection.count} collections(s)"
puts "  #{Factory.count} factories"
puts "  #{Generative.count} generative(s)"




#######################
## query for mint candidates

mints = Inscribe.mints
puts "   #{mints.size} mint candidate(s)"

mints.each_with_index do |rec,i|
    ## puts "==> mint #{i} - num #{rec.num} - #{rec.bytes} bytes - #{rec.date}"
    ## puts rec.content 

    ## skip processing if alreay in db
    gen = Generative.find_by( id: rec.id )  
    if gen
      print '.'
      next 
    end

    ## try to auto-fill / add collections
    text = rec.content.strip

    ## todo/fix:
    ##   must follow format (deploy classic (json)? or standard (txt)?)

    data = nil  ## first see if valid json
    ## check if text or json format
    if OG.is_mint?( text )
      data = OG.parse_mint( text )
    else  ## assume json
      begin
        data = JSON.parse( text )
      rescue JSON::ParserError => ex
        ## keep going
        ## puts "!! WARN - skip mint - json parse error"
        next
      end
    end

    ## note skip if not og mint
    next if data['p']   != 'orc-721' && 
            data['op']  != 'mint'

            
    slug = data['s']
  
    fac = Factory.find_by( id: slug )
    if fac && DEPLOYS[slug]
        ## todo/fix:
        ##  double check inscribe num in collection and deploys  MATCH!!!

        ## try validate
        errors = validate_mint( rec.num, data, deploys: DEPLOYS )
 
        if errors.size == 0
          puts
          puts "==> mint #{i} - num #{rec.num} - #{rec.bytes} bytes - #{rec.date}"
          puts rec.content 

          gen = Generative.create( id: rec.id, 
                                   factory_id: fac.id,
                                   g:  data['g'].join( ' ' ) )
          pp gen
        else
           ## report broken mint errrors here
        end
    else
       puts "!! WARN - factory >#{slug}< not found:"
       pp rec
       puts rec.content
       exit 1
    end
end


puts
puts
puts "  #{Inscribe.count} inscribe(s)"
puts "  #{Blob.count} blob(s)"
puts "  #{Collection.count} collection(s)"
puts "  #{Factory.count} factories"
puts "  #{Generative.count} generative(s)"



puts "bye"