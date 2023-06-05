require 'cocos'

require_relative 'validate'


## test process run
##    for now diypunks only; sorry


DEPLOYS ={
  'diypunks' => { 'num' => 9947030,  ## deploy inscribe num
                  'g'   => 60     ##  max g range e.g. 0-59 (60)
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


recs = read_csv( './sandbox/ordinals.csv' )
puts "   #{recs.size} record(s)"


cache_dir = '../ordinals.cache/btc'


mints = []

recs.each_with_index do |rec,i|
  id = rec['id']
  puts "==> #{i} - #{id}"


  ## step 1)  get metadata records
  meta_path    = "#{cache_dir}/#{id}.json"

  meta = nil
   if !File.exist?( meta_path )
      puts "!! ERROR - meta data record not found"
      exit 1
   end

   meta = read_json( meta_path )

   content_type = meta['content type']
   if !content_type.start_with?( 'text/' )
    puts "!! ERROR - expected text inscribe; got:"
    pp meta
    exit 1
   end

   puts "   content_type: >#{content_type}<"

   num = title_to_num( meta['title'])
   if num.nil?
     puts "!! ERROR - expected to find incription num in title; got:"
     pp meta
     exit 1
   end

   puts "   inscribe num: #{num}"

   ## step 2) get content - check for mime type - text/

   path    = "#{cache_dir}/content/#{id}.txt"
   if !File.exist?( path )
    puts "!! ERROR - content not found"
    exit 1
   end

   ## note: always assumes utf8 encoding for now
   content = read_text( path )
   puts "  text:"
   pp content


  ######
  ## todo/fix - single step - validate json only first
  ######


   ## note: tod/fix - need to filter out deploys and other ops!
   ##             from error list
   errors = validate_mint( num, content, deploys: DEPLOYS )
   if errors.size != 0
     puts " !! ERROR(S):"
      errors.each do |msg|
          puts msg
      end
   else
     puts "OK"

     data = JSON.parse( content )
     slug = data['s']
     if slug != 'diypunks'
      puts "!! ERROR - sorry - only setup for diypunks for now"
      exit 1
     end
     g  = data['g']

     puts "  #{num}, #{g.join(' ')}"
     ## add validated mint  - note: dataset values always strings!
     mints << [num.to_s, g.join(' ')]
   end
end



puts "  #{mints.size} mint(s)"

## sort by inscrib num
mints = mints.sort { |l,r|  l[0].to_i(10) <=> r[0].to_i(10) }


pp mints

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

write_text( "./diypunks/mint.csv", buf )



puts "bye"