$LOAD_PATH.unshift( "../ordbase/ordinals/lib" )
$LOAD_PATH.unshift( "../ordbase/ordlite/lib" )
require 'ordlite'


require_relative 'config'


OrdDb.open( './ord.db' )

diypunks = Factory.find( 'diypunks' )
puts "  inscribe no. #{diypunks.inscribe.num} - #{diypunks.inscribe.date}"
#=> inscribe no. 9947030 - 2023-05-29 16:38:27 UTC 

punk = diypunks.generate( 0,15,31,44,54 )

punk.save( "./tmpv2/punk.png" )
punk.zoom(4).save( "./tmpv2/punk@4x.png" )


__END__
 



recs = Factory.joins(:inscribe).order('num desc').to_a
recs.each_with_index do |rec,i|

  puts "==> #{i+1}  #{rec.id} >#{rec.name}< max. #{rec.max} - #{rec.dim}"
 
  puts "   #{rec.layers.count} layer(s):"

  generator = rec.generator
  puts "      #{generator.count} tile(s)"

  ## double check counts
  slug = rec.id
  deploy = DEPLOYS[ slug ]
  pp deploy
  if deploy['g'] != generator.count
    puts "!! ERROR - tile count (max g number) mismatch; got #{generator.count} - expected #{deploy['g']}"
    exit 1
  end

  g = [0]
  sample = rec.generate( *g )
  sample.save( "./tmp/#{slug}-#{g.join('-')}.png" )
end


puts "bye"