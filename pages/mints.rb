####
#  generate a feed / page with the last hundred mints
#
#  to run use:
#   $ ruby pages/mints.rb

$LOAD_PATH.unshift( "../ordbase/ordinals/lib" )
$LOAD_PATH.unshift( "../ordbase/ordlite/lib" )
require 'ordlite'


OrdDb.open( './ord.db' )


puts
puts "  #{Inscribe.count} inscribe(s)"
puts "  #{Blob.count} blob(s)"
puts "  #{Collection.count} collection(s)"
puts "  #{Factory.count} factories"
puts "  #{Generative.count} generative(s)"



##
## fix - remove broken mint
## ==> mint 50 - num 15131911 - 151 bytes - 2023-07-07 09:12:39 UTC
## og mint diymaxibiz 85 6 69 21
## og mint diymaxibiz 80 69 30
## og mint diymaxibiz 84 0 25 34
## og mint diymaxibiz 20 0 26 28 29 30
## og mint diymaxibiz 16 78 30
Generative.delete( Inscribe.find_by( num: 15131911 ).id )



#######################
## query for (latest) mint via generatives 

max = 100
mints = Generative.joins( :inscribe ).order( 'num desc' ).limit( max )
puts "   #{mints.size} mint(s)"



mints.each_with_index do |generative,i|
    rec = generative.inscribe
    puts "==> mint #{i} - num #{rec.num} - #{rec.bytes} bytes - #{rec.date}"
    puts rec.content 
end



buf =<<TXT
New to Generative ORC-721?  See the [Getting Started Guide & Documentation »](https://github.com/ordbase/generative-orc-721)


## Mints

TXT


mints.each_with_index do |generative,i|
    rec = generative.inscribe
    puts "==> mint #{i} - num #{rec.num} - #{rec.bytes} bytes - #{rec.date}"
    puts rec.content 

  buf << "\n"
  buf << "[№ #{rec.num}](https://ordinals.com/inscription/#{rec.id}) - #{rec.date}"
  buf << "<br>\n"

  ## add images
  if generative.factory.id == 'diyorditroops'
    buf << %Q[<img src="https://orc721.github.io/orditroops.starter/num/#{rec.num}.png" width="10%">]
    buf << "<br>\n"  
  else
    buf << "![](https://ordbase.github.io/num/#{rec.num}.png) "
    buf << "4x ![](https://ordbase.github.io/num/#{rec.num}@4x.png)"
    buf << "<br>\n"  
  end
  
  buf << "```\n"
  buf << rec.content
  buf << "\n"
  buf << "```\n"
end


buf += <<TXT

---

Page Generated with [Ordlite - Ordinal Inscription (SQL) Database - Scripts](https://github.com/ordbase/ordbase/tree/master/ordlite).  
TXT

## puts buf
write_text( "./tmp/orc721/README.md", buf )


puts "bye"
