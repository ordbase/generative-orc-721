####
#  generate a feed / page with the last collections (deploys)
#
# to run use:
#   $ ruby -I ./lib sandbox/collections.rb

require 'ordlite'
require 'cocos'
require 'ordinals'


OrdDb.connect( adapter:  'sqlite3',
               database: './deploy.db' )


puts
puts "  #{Inscribe.count} inscribe(s)"
puts "  #{Blob.count} blob(s)"
puts "  #{Collection.count} collection(s)"


recs = Collection.joins(:inscribe).order('num desc').to_a
recs.each_with_index do |rec,i|
  puts "==> #{i+1}  #{rec.id} >#{rec.name}< max. #{rec.max}"
  puts "   #{rec.layers.count} layer(s):"
  rec.layers.each_with_index do |layer,i|
     puts "   [#{i}]  #{layer.num} - #{layer.id}"
  end
  puts
end



# Generative! Your Numbers, Your Image! -  Ordgen / ORC-721

buf =<<TXT
## Collections

TXT


recs.each_with_index do |rec,i|
    puts "==> deploy #{i} - num #{rec.inscribe.num} - #{rec.inscribe.bytes} bytes - #{rec.inscribe.date}"
    puts rec.inscribe.content 

  buf << "\n"
  buf << "**#{rec.name}** (#{rec.id}) max. #{rec.max} "
  buf << "- [№ #{rec.inscribe.num}](https://ordinals.com/inscription/#{rec.inscribe.id}) - #{rec.inscribe.date}"
  buf << "<br>\n"  
  buf << "#{rec.layers.count} layer(s)"
  buf << "<br>\n"  
  # buf << "![](https://ordbase.github.io/num/#{rec.num}.png) "
  # buf << "4x ![](https://ordbase.github.io/num/#{rec.num}@4x.png)"

  rec.layers.each_with_index do |layer,pos|
    # buf << "[№ #{layer.num}](https://ordinals.com/inscription/#{layer.id}) "
    # buf << "![](../num/#{layer.num}.png)"
    # buf << "\n"  

    buf << %Q[<a href="https://ordinals.com/inscription/#{layer.id}" title="№ #{layer.num}">]
    buf << %Q[<img src="../num/#{layer.num}.png" alt="№ #{layer.num}"></a>]
    buf << "\n"  


    if layer.blob.nil?
      content = Ordinals.content( layer.id )
      pp content
      #=> #<Ordinals::Api::Content:0x000001a1352df938
      #      @data="RIFF\xF8\v\x00\x00WEBPVP8 \xEC\v\x00\x00...",
      #      @length=3072,
      #      @type="image/png"
 
      Blob.create( id: layer.id, content: content.data )
      layer = Inscribe.find( layer.id )  ## refresh
      sleep( 0.5 )
    end
 
    ## note: assume png for now always
    write_blob( "./tmp/num/#{layer.num}.png", layer.content )
  end 
  buf << "\n" 
end



buf += <<TXT

---

Page Generated with [Ordlite - Ordinal Inscription (SQL) Database - Scripts](https://github.com/ordbase/generative-orc-721/tree/master/ordlite).  
TXT

## puts buf
write_text( "./tmp/collections.md", buf )


puts "bye"