####
# to run use:
#   $ ruby -I ./lib sandbox/test_query.rb

require 'ordlite'


OrdDb.connect( adapter:  'sqlite3',
               database: './ord.db' )



puts
puts "  #{Inscribe.count} inscribe(s)"
puts "  #{Blob.count} blob(s)"


####################
## query for deploy candidates

deploys = Blob.joins(:inscribe).where( "content LIKE '%deploy%' AND (content LIKE '%orc-721%' OR content LIKE '%og%')" )
               .order( 'num' )
puts "   #{deploys.size} deploy candidate(s)"

deploys.each_with_index do |rec,i|
    puts "==> deploy #{i} - num #{rec.inscribe.num} - #{rec.inscribe.bytes} bytes - #{rec.inscribe.date}"
    puts rec.content 
end


#######################
## query for mint candidates

mints = Blob.joins(:inscribe).where( "content LIKE '%mint%' AND (content LIKE '%orc-721%' OR content LIKE '%og%')" )
               .order( 'num' )
puts "   #{mints.size} mint candidate(s)"

## print last hundred mint candidates
mints[-100,100].each_with_index do |rec,i|
    puts "==> mint #{i} - num #{rec.inscribe.num} - #{rec.inscribe.bytes} bytes - #{rec.inscribe.date}"
    puts rec.content 
end



puts "   #{deploys.size} deploy candidate(s)"
#=> 123 deploy candidate(s)
puts "   #{mints.size} mint candidate(s)"
#=> 7453 mint candidate(s)


puts "bye"