require 'cocos'

martians = {
'Orange'      =>  '0829dc471f8bb92a971dfdfb00a71c016b833c8f1d5f39dcb15aa5535d08fc15i0',
 'Gold'        =>  '9482552ec759b76577b28923741eb4bfc7770cead528755bf8fa44196ae9318ci0',
 'Cyber Green'  =>  '5b8eb4a05f13fffc49f824f457fb080b67e4fdc312fbbf2f804cef59e6d5fad2i0',
 'Deep Blue'    =>  '85e0efd6cc2801ab7e1fe28e23110441348ca40481599f880c571ff4f69f066fi0',
 'Midnight'    =>  '7953ccb6614a41e7b4c4ed2a2b112b52feda387de92de2c1a314f03d5da41955i0',
 'Magenta'     =>  '2f1219924cfa01f9816581e8a39e201f15e19ab447e852ff9b43b13fa7b0c75di0',
 'Mars Red'     =>  'e60f597ec41c50e823ea382c101dfc2f30c13a927222be3b73cedd88bd1b9237i0',
}

data = []
martians.each_with_index do |(name, id),i|

  h = {
    'id' => id,
    'meta' => {
       'name' => "Martian ##{i}",
       'attributes' => [{ 'trait_type' => 'Base',
                           'value'     => name }
                       ]
    }
  }
  data << h
end

data

pp data

write_json( "./market/martians_inscriptions.json",
             data )

puts "bye"