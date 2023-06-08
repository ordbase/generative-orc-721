require 'ordinals'

## try to fetch metadata

## slug = 'diypunks'
## slug = 'diyordibots'
## slug = 'diyordibots-v2'
## slug = 'diycoolcats'
slug = 'btcwords'

recs = read_csv( "./sandbox/tmp/ordinals.#{slug}.csv" )
puts "   #{recs.size} record(s)"


cache_dir = '../ordinals.cache/btc'



recs.each_with_index do |rec,i|
  id = rec['id']
  puts "==> #{i} - #{id}"


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

       sleep( 0.5 )
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

      sleep( 0.5 )
   end
end




puts "bye"