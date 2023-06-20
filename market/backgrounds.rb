require 'cocos'

backgrounds = {
   ## backgrounds
   'Bitcoin Orange' => '189b02ffc8aac68a45102e9837a1ca92e422bf5544d9011a863626cf6b0abeeai0',
   'Bitcoin Pattern' => '43e93e43f2dac75b141baaa5b08df440e0b6ec5755577a9554a7af6540447bb7i0',
   'Red' => '39d774f7d7514371c88bc4f939346f6b23000c9892ac4ae8ea36c76694e3b842i0',
   'Green' => 'b268b2acccd6b04680c2aa3130863ffbaa450f6870f100af678428cd07212ef6i0',
   'Dollar Pattern' => 'ac810c9098681e100964166b7510d1ac371c147861b0ae2a862da3a8b8256037i0',
   'Blue' => '4b9f880df07b072a4147a62acdd0881d024d14da6d84174db9b5ac555b71b346i0',
   'Aqua' => '014ad6ed6297bc4ed624b2856e036c6bde115d51eb7200b14e3b3413ad53db08i0',
   'Classic' => 'e139b5b0649186772cbf044bb8d3c5e43b77e3cf0472008ce2aaf52966c921eci0',
   'Rainbow' => '6eb271ad3fdd15cc2ec34dda462e71aaa8a7ef7e306cfd189931ef37216a9c60i0',
   'Ukraine' => '47cb34f1d73371df0b27ca0a259927fa80e2b2d9ee0e1d487fca5c9029b67b49i0',
}

data = []
backgrounds.each_with_index do |(name, id),i|

  h = {
    'id' => id,
    'meta' => {
       'name' => "Boring Background ##{i}",
       'attributes' => [{ 'trait_type' => 'Background',
                           'value'     => name }
                       ]
    }
  }
  data << h
end

data

pp data

write_json( "./market/backgrounds_inscriptions.json",
             data )

puts "bye"