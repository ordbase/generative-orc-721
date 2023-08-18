require 'ordlite'


OrdDb.open( './ordbase.db' )

puts
puts "  #{Inscribe.count} inscribe(s)"
puts "  #{Blob.count} blob(s)"

inscribes = Inscribe.joins( :blob )
                   .where( 'content LIKE ?', '%deploy%' )
                   .order( 'num' )
puts "  #{inscribes.size} deploy inscribe candidate(s)"
                
inscribes = Inscribe.joins( :blob )
                   .where( 'content LIKE ?', '%mint%' )
                   .order( 'num' )
puts "  #{inscribes.size} mint inscribe candidate(s)"



require_relative 'og'


inscribes = Inscribe.joins( :blob )
                   .where( 'content LIKE ?', '%deploy%' )
                   .order( 'num' )
puts "  #{inscribes.size} inscribe candidate(s)"
#=> 1 deploy inscribe candidate(s)

inscribes.each do |inscribe|
  data = OG.parse_deploy( inscribe.text )
  pp data
end

inscribes = Inscribe.joins( :blob )
                   .where( 'content LIKE ?', '%mint%' )
                   .order( 'num' )
puts "  #{inscribes.size} inscribe candidate(s)"
#=> 20 mint inscribe candidate(s)

inscribes.each do |inscribe|
  data = OG.parse_mint( inscribe.text )
  pp data
end



puts "bye"