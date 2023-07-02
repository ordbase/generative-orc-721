####
#  generate a feed / page with the last hundred mints
#
# to run use:
#   $ ruby -I ./lib sandbox/mints.rb

require 'ordlite'
require 'cocos'


OrdDb.connect( adapter:  'sqlite3',
               database: './ord.db' )


puts
puts "  #{Inscribe.count} inscribe(s)"
puts "  #{Blob.count} blob(s)"



#######################
## query for mint candidates

mints = Inscribe.mints
puts "   #{mints.size} mint candidate(s)"

## print last hundred mint candidates
max = 100
top  = mints.reverse[0,max]


top.each_with_index do |rec,i|
    puts "==> mint #{i} - num #{rec.num} - #{rec.bytes} bytes - #{rec.date}"
    puts rec.content 
end



buf =<<TXT
#   Ordgen / ORC-721 Mints

TXT

top.each_with_index do |rec,i|
    puts "==> mint #{i} - num #{rec.num} - #{rec.bytes} bytes - #{rec.date}"
    puts rec.content 

  buf << "\n"
  buf << "[№ #{rec.num}](https://ordinals.com/inscription/#{rec.id}) - #{rec.date}"
  buf << "<br>\n"
  buf << "![](https://ordbase.github.io/num/#{rec.num}.png) "
  buf << "4x ![](https://ordbase.github.io/num/#{rec.num}@4x.png)"
  buf << "<br>\n"  
  buf << "```\n"
  buf << rec.content
  buf << "\n"
  buf << "```\n"
end



## puts buf
write_text( "./tmp/mints.md", buf )


puts "bye"