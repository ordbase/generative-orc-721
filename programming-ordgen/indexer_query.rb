require 'ordlite'


OrdDb.open( './ordbase.db' )

puts
puts "  #{Inscribe.count} inscribe(s)"
puts "  #{Blob.count} blob(s)"

inscribes = Inscribe.search( 'deploy' )
puts "  #{inscribes.size} deploy inscribe candidate(s)"
                
inscribes = Inscribe.search( 'mint' )
puts "  #{inscribes.size} mint inscribe candidate(s)"



require_relative 'og'


inscribes = Inscribe.search( 'deploy' )
puts "  #{inscribes.size} inscribe candidate(s)"
#=> 1 deploy inscribe candidate(s)

inscribes.each do |inscribe|
  data = OG.parse_deploy( inscribe.text )
  pp data
end

inscribes = Inscribe.search( 'mint' )
puts "  #{inscribes.size} inscribe candidate(s)"
#=> 20 mint inscribe candidate(s)

inscribes.each do |inscribe|
  data = OG.parse_mint( inscribe.text )
  pp data
end



puts "bye"