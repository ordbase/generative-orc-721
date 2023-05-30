require 'ordinals'

## try to fetch metadata


recs = read_csv( './sandbox/ordinals.csv' )
puts "   #{recs.size} record(s)"



recs.each_with_index do |rec,i|
  id = rec['id']
  puts "==> #{i} - #{id}"

  path = "./cache/#{id}.json"

  next  if File.exist?( path )


  content = Ordinals.content( id )
  pp content
  #=> #<Ordinals::Api::Content:0x000001a1352df938
  #      @data="RIFF\xF8\v\x00\x00WEBPVP8 \xEC\v\x00\x00...",
  #      @length=3072,
  #      @type="image/png"

  puts "data:"
  puts content.data

  txt = content.data.force_encoding( 'UTF-8' )

  if txt.index( /[“”]/)
     puts "!! WARN: includes smart quotes"
     txt = txt.gsub( /[“”]/, '"' )
     puts "FIXED?"
     puts txt
  end

  data = JSON.parse( txt )
  pp data

  write_text( path, txt )
end

puts "bye"