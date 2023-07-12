####
# to run use:
#   $ ruby pipeline2/mints.rb

$LOAD_PATH.unshift( "./ordlite/lib" )
require 'ordlite'

require 'cocos'
require_relative '../pipeline/validate'




DEPLOYS ={
  'diypunks' => { 'num' => 9947030,  ## deploy inscribe num
                  'g'   => 60     ##  max g range e.g. 0-59 (60)
                },
  'diypunks-v2'  => { 'num' => 10282958,
                      'g'   => 60
                    },
  'diyordibots' => {  'num' => 10339670,
                      'g'   => 30
                    },
  'diyordibots-v2' => {  'num' => 10347807,
                         'g'   => 30
                      },
  'diycoolcats' => { 'num' => 10509482,
                    'g'   =>  70
                  },
  'btcwords'  => { 'num' => 11066199,
                  'g'   =>  162   ## 27x6=162
                 },
  'diybirdies' => {  'num' => 11326228,
                     'g' => 220   ## 20x11=220
                  },
   'diyapes'  => { 'num' => 11803822,
                    'g'   =>  26   ## 0-25 (26) inscribe ids
                 },
   'diyaliens'  => { 'num' => 11834519,
                    'g'   =>  26   ## 0-25 (26) inscribe ids
                   },
   'diymartians' => {  'num' => 12799513,
                       'g'   =>  50   ## 0-49 (50) inscribe ids
                    },
   'orangepixels' => {  'num' => 13070955,
                       'g'   =>  576   ## 0-575 (576 - 24*24)
                       },
    'diyphunks' => { 'num' => 13418851,
                     'g'   => 60,     ##  max g range e.g. 0-59 (60)
                   },
    'diymaxibiz' => { 'num' => 14999762,
                   'g'   => 90,     ##  max g range e.g. 0-89 (90)
                 },
    'diyorditroops' => { 'num' => 15567938,
                   'g'   => 58,     ##  max g range e.g. 0-57 (58)
                 },
}



OrdDb.connect( adapter:  'sqlite3',
               database: './ord.db' )



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

    data = nil  ## first see if valid json
    ## check if text or json format
    if OG.is_mint?( text )
      data = OG.parse_mint( text )
      text = data.to_json  ## hack for now for validate  
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
  
    collection = Collection.find_by( id: slug )
    if collection && DEPLOYS[slug]
        ## todo/fix:
        ##  double check inscribe num in collection and deploys  MATCH!!!

        ## try validate
        errors = validate_mint( rec.num, text, deploys: DEPLOYS )
 
        if errors.size == 0
          puts
          puts "==> mint #{i} - num #{rec.num} - #{rec.bytes} bytes - #{rec.date}"
          puts rec.content 

          gen = Generative.create( id: rec.id, 
                                   collection_id: collection.id,
                                   g:  data['g'].join( ' ' ) )
          pp gen
        else
           ## report broken mint errrors here
        end
    else
       puts "!! WARN - collection >#{slug}< not found:"
       pp rec
       puts rec.content
    end
end


puts
puts
puts "  #{Inscribe.count} inscribe(s)"
puts "  #{Blob.count} blob(s)"
puts "  #{Collection.count} collection(s)"
puts "  #{Generative.count} generative(s)"



puts "bye"