require 'cocos'

require_relative 'validate'


## test process run
##    for now diypunks,
##            diyordibots,
##            diycoolcats only; sorry

## SLUG = 'diypunks'
## SLUG = 'diypunks-v2'
## SLUG = 'diyordibots'
## SLUG = 'diyordibots-v2'
## SLUG = 'diycoolcats'
## SLUG = 'btcwords'
## SLUG = 'diybirdies'
## SLUG = 'diyapes'
## SLUG = 'diyaliens'
## SLUG = 'diymartians'
# SLUG = 'orangepixels'
# format = 'json'

## SLUG = 'diyphunks'
## SLUG = 'diymaxibiz'
SLUG = 'diyorditroops'
format = 'text'


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






##  "title": "Inscription 9992615",

TITLE_RX = /^Inscription (?<num>[0-9]+)$/i

def title_to_num( str )
   if m=TITLE_RX.match( str )
      m[:num].to_i(10)    ## use base 10
   else
     nil   ## not found - raise exception - why? why not?
   end
end




recs = read_csv( "./sandbox/tmp/ordinals.#{SLUG}.csv" )
puts "   #{recs.size} record(s)"



cache_dir = '../ordinals.cache/btc'


num_to_ids = []

mints = []
error_log = ""

OG_MINT_RX = /\A
               og
              [ ]+
               mint
              [ ]+
              /x

## single-line for now
OG_MINT_SLUG_NUMS_RX = /\A
            og
           [ ]+
            mint
           [ ]+
             (?<slug>[a-z][a-z0-9]*)
           [ ]+
            (?<nums>[0-9]+
                 ([ ]+[0-9]+)*
             )
          \z/x




recs.each_with_index do |rec,i|
  id = rec['id']
  ## puts "==> #{i} - #{id}"


  ## step 1)  get metadata records
  meta_path    = "#{cache_dir}/#{id}.json"

  meta = nil
   if !File.exist?( meta_path )
      puts "!! ERROR - meta data record not found"
      exit 1
   end

   meta = read_json( meta_path )

   content_type = meta['content type']
   if !(content_type.start_with?( 'text/' )  ||
        content_type.start_with?( 'application/json'))
      puts "!! expected text/* or application/json inscribe; got:"
      pp meta
      exit 1
   end


   ## puts "   content_type: >#{content_type}<"

   num = title_to_num( meta['title'])
   if num.nil?
     puts "!! ERROR - expected to find incription num in title; got:"
     pp meta
     exit 1
   end

   ## step 2) get content - check for mime type - text/

   path    = "#{cache_dir}/content/#{id}.txt"
   if !File.exist?( path )
    puts "!! ERROR - content not found"
    exit 1
   end

   ## note: always assumes utf8 encoding for now
   content = read_text( path )


  ######
  ## todo/fix - single step - validate json only first
  ######
   errors = []
   data   = nil

   if format == 'text'

      ## strip leading trailing spaces - why? why not?

      ## quick check for now only
      ##   must start with og
       if OG_MINT_RX.match( content.strip ).nil?
          puts "!! SKIP - NO MATCH OG_MINT:"
          puts content
          next
       end

       ## try to convert to json
       m=OG_MINT_SLUG_NUMS_RX.match( content.strip )

       if m.nil?   ## skip for now
          msg = "protocol format -- no pattern match; expected (single) line in the format 'og mint <slug> <nums>'" 
          # puts "!! ERROR - #{msg}:"
          # puts content
          errors = [msg]
       else
          data = {
            'p'  => 'orc-721',
            'op' => 'mint',
            's'  => m[:slug],
            'g'  => m[:nums].split( /[ ]+/).map {|num| num.to_i(10) }
            }
          puts data.to_json
          errors = validate_mint( num, data.to_json, deploys: DEPLOYS )
        end
    else ## assume "classic" json

     ## first see if valid json
     begin
       data = JSON.parse( content )
     rescue JSON::ParserError => ex
       ## keep going
     end


   if data
      ## quick fuzzy check if include for mint checking
      ##  p|P == orc-721 (insensitive) must MATCH  AND
      ##  op|OP == mint (insensitive) must MATCH  AND
      ##  s|S|slug|SLUG == <slug> (insensitive) must MATCH
      next if (data['p']||data['P']||'').downcase.strip   != 'orc-721'  ||
              (data['op']||data['OP']||'').downcase.strip  != 'mint'    ||
              (data['s']||data['S']||data['slug']||data['SLUG']||'').downcase.strip != SLUG
   else
      ## use regex fuzzy check (json parse failed!!)
      ## check for orc-721
      p_rx  = /\borc-?721\b/i
      op_rx = /\bmint\b/i
      s_rx  = /\b#{SLUG}\b/i

      next if p_rx.match( content ).nil?  ||
              op_rx.match( content ).nil? ||
              s_rx.match( content ).nil?
   end


    ## note: todo/fix - need to filter out deploys and other ops!
    ##             from error list
    errors = validate_mint( num, content, deploys: DEPLOYS )
  end

   if errors.size != 0
     buf = ""
     buf << "!! ERROR(S) in  #{num} / #{id}:\n"
     buf << content
     buf << "\n\n"
     errors.each do |msg|
        buf << "   - #{msg}\n"
     end
     buf << "\n"

     puts buf              ## print to screen
     error_log << buf      ## auto-add to error log
   else
     slug = data['s']
     if slug != SLUG
      puts "!! ERROR - sorry - only setup for >#{SLUG}<"
      exit 1
     end
     g  = data['g']

     puts "OK  #{num}, #{g.join(' ')}"
     ## add validated mint  - note: dataset values always strings!
     mints << [num.to_s, g.join(' ')]

     num_to_ids << [num.to_s, id]
   end
end



puts "  #{mints.size} mint(s)"

## sort by inscrib num
mints = mints.sort { |l,r|  l[0].to_i(10) <=> r[0].to_i(10) }


## pp mints

### save
##

headers = ['num', 'g']
buf = String.new('')
buf << headers.join( ', ' )
buf << "\n"
mints.each do |values|
  buf << values.join( ', ' )
  buf << "\n"
end

write_text( "./#{SLUG}/mint.csv", buf )

write_text( "./#{SLUG}/error.txt", error_log )



## sort by inscrib num
num_to_ids = num_to_ids.sort { |l,r|  l[0].to_i(10) <=> r[0].to_i(10) }

headers = ['num', 'id']
buf = String.new('')
buf << headers.join( ', ' )
buf << "\n"
num_to_ids.each do |values|
  buf << values.join( ', ' )
  buf << "\n"
end


write_text( "./market/#{SLUG}_ids.csv", buf )


puts "bye"