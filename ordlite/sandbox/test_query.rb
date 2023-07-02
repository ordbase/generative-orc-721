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

deploys = Inscribe.deploys
puts "   #{deploys.size} deploy candidate(s)"

deploys.each_with_index do |rec,i|
    puts "==> deploy #{i} - num #{rec.num} - #{rec.bytes} bytes - #{rec.date}"
    puts rec.content 
end


punks_deploys = Inscribe.deploys_by( slug: 'diypunks')
puts "   #{punks_deploys.size} deploy candidate(s)"



#######################
## query for mint candidates

mints = Inscribe.mints
puts "   #{mints.size} mint candidate(s)"

## print last hundred mint candidates
mints[-100,100].each_with_index do |rec,i|
    puts "==> mint #{i} - num #{rec.num} - #{rec.bytes} bytes - #{rec.date}"
    puts rec.content 
end


phunks_mints = Inscribe.mints_by( slug: 'diyphunks')
puts "   #{phunks_mints.size} mint candidate(s)"


puts "   #{deploys.size} deploy candidate(s)"
#=> 123 deploy candidate(s)
puts "   #{mints.size} mint candidate(s)"
#=> 7453 mint candidate(s)


puts "bye"