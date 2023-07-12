######################
#  to run use
#   $  ruby  pipeline2/prepare.rb

require 'cocos'
require 'ordinals'


## get inscription  links
## e.g.
##    inscription/e8830c5fbdfc2f529350fd04a2ac20bb097dce98f159223837513ae3c8d05714i0



INSCRIBE_RX = %r{
              inscription/
                 (?<id>[a-fi0-9]+)
            }ix


def prepare_inscribes( dir )

  pages = Dir.glob( "#{dir}/**/*.html")

  inscribes = []

  rx = INSCRIBE_RX
  pages.each do |page|
    txt = read_text( page )

    txt.scan( rx ) do |_|
      m = Regexp.last_match
  
      inscribes << m[:id].strip
    end
  end


  ## pp inscribes
  puts "   #{inscribes.size} inscribe(s)"

  ## turn into symbol (to make uniq work ??)
  inscribes = inscribes.uniq
  ## pp inscribes
  puts "   #{inscribes.size} inscribe(s) - unique"

  inscribes
end


ids = prepare_inscribes( './inbox' )


cache_dir = '../ordinals.cache/btc'
delay_in_s = 0.5

ids.each_with_index do |id,i|
  puts "==> #{i+1}/#{ids.size} - #{id}"


  ## step 1)  get metadata records
  meta_path    = "#{cache_dir}/#{id}.json"

  meta = nil
   if File.exist?( meta_path )
       meta = read_json( meta_path )
   else
       ## fetch and cache in cache
       meta = Ordinals.inscription( id )
       pp meta

       write_json( meta_path, meta )

       sleep( delay_in_s )
   end


   content_type = meta['content type']
   if !(content_type.start_with?( 'text/' )  ||
        content_type.start_with?( 'application/json'))
    puts "!! expected text/* or application/json inscribe; got:"
    pp meta
    exit 1
   end

   puts "   content_type: >#{content_type}<..."

   ## step 2) get content - check for mime type - text/
   ##   note - save appliation/json as .txt for now too - why? why not?

   path    = "#{cache_dir}/content/#{id}.txt"
   if File.exist?( path )
       puts "  in cache"
   else
      ## note: save text as blob - byte-by-byte as is  (might be corrupt text)

      content = Ordinals.content( id )
      pp content
      #=> #<Ordinals::Api::Content:0x000001a1352df938
      #      @data="RIFF\xF8\v\x00\x00WEBPVP8 \xEC\v\x00\x00...",
      #      @length=3072,
      #      @type="image/png"

      puts "data:"
      puts content.data

      write_blob( path, content.data )

      sleep( delay_in_s )
   end
end


puts "bye"

