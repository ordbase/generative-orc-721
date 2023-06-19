require 'ordinals'
require 'pixelart'


##############################
#   d.i.y. martians (attribute) inscribes


inscribes =
{

 ## 7 base martians (aliens vol. 2)
 'orange'      =>  '0829dc471f8bb92a971dfdfb00a71c016b833c8f1d5f39dcb15aa5535d08fc15i0',
 'gold'        =>  '9482552ec759b76577b28923741eb4bfc7770cead528755bf8fa44196ae9318ci0',
 'cybergreen'  =>  '5b8eb4a05f13fffc49f824f457fb080b67e4fdc312fbbf2f804cef59e6d5fad2i0',
 'deepblue'    =>  '85e0efd6cc2801ab7e1fe28e23110441348ca40481599f880c571ff4f69f066fi0',
 'midnight'    =>  '7953ccb6614a41e7b4c4ed2a2b112b52feda387de92de2c1a314f03d5da41955i0',
 'magenta'     =>  '2f1219924cfa01f9816581e8a39e201f15e19ab447e852ff9b43b13fa7b0c75di0',
 'marsred'     =>  'e60f597ec41c50e823ea382c101dfc2f30c13a927222be3b73cedd88bd1b9237i0',

 'smile'       =>  '3459b14a4fcb7bce1df0465abc711b556caba6f7b42d4f925f1ddf830be47125i0',

 'lasereyes'  =>  '72fe7ebda802852f499dca865ec22ac43eacfcf4796d761969ae8358791e943ci0',
 'lasereyes-gold'  =>  '4db2e931b5cd489d8007d111d20ab97d84161b84c8f7ff3038e1afe79567b9afi0',
 'lasereyes-blue'  =>  '4869c9bb7cf23e68ad94da5b1e9de1feff1ebdcaf9a08fccca5f1887dd40e239i0',

  'nounie'  => 'a0d11e78978a9dd5f1d891b71f06bd2d411c08372eba1f23e8b0722474388130i0',  # red-ish (small)

  'noun1' => '2c2d812754b9374ffb699173da7f6d476af138a99906b66b8453cc4343305167i0', # red-ish
  'noun2' => '964c52312f1db9025695b181d5f631292d29bec63ff9587138a589cb5ff8c26di0', # blue-ish
  'noun3' => '545fd4d45d2f6d732d48accc082f72b67a00d19f88517320f814bf1fe827c816i0', # rgb

  'm/pipe' =>         '92e7f48454546718f98103d7464d954033adbee21855f06584be06faa3e291ddi0',
  'm/cigarette' =>   'a01012b213ed425c5d4038bc36016f19f4f342ca052ff9bf6971672164e1a402i0',

  'm/nerd_glasses' => 'd61fc2a89ecc6ae65cf91cdfac9edc37fd60c38621dac211f3a70891ef79b69ai0',
  'm/vr'   =>         '680e2ee8cad86aa174b4f3373d733370c9a6fc4230b9708d520a0f6bcb8e72a6i0',
  'm/3d_glasses' =>  '56d3f4f661b2b4a9fc17755171d7cf4da74e570614b6b45de0cc87a809c3eb3ci0',
  'm/eye_mask'  =>     'fe4321178bd841e52fdeb72ce4456c5b7596c0d611b19da15ba75ec63b5314cai0',
  'm/regular_shades' => 'eddc1242f0fd290e130332e046897ad41dce1e7e112df48ecf2168e43172d383i0',
  'm/small_shades' => 'a2110fb4afaa29bc70bcfac445f750ecb5e81777e8d080be2d2b07eb030ba0ffi0',
  'm/horned_rim_glasses' => 'c1277df4b986067b2a3f006d717b7f6d042896840c8b592e5a8b9ff22444b08fi0',
  'm/bandana' => 'a6b4b81f69e8c217db24f0a71954195d67ced49a819b67a4daf9f3ca7fa1b971i0',
  'm/earring' => '06136a5b4fb585069ef6265a0fde3baf67ee914b9f784d2c951f3a8187800d54i0',
  'm/spots'  =>   '1355524a2aab576e069bac91227b0e52d227d65d84c5535377d3a0ea4e44d470i0',
  'm/knitted_cap' => '7c2fd41b52624ddb1ba11fe1c6d95475f2e42c4b53d6aaf6a16a09064acebe38i0',
  'm/headband'  => '83827ec13cb55a35fe3adca5acf67caf943c3bd6810f8fa893b067e8015c8f19i0',
  'm/tophat'  => '5b1e638c050318bec23f17b8b7758ccf13945e422516da6c722c67ae5ed4e26di0',
  'm/eye_patch' => '722dfdc90a67ff7eb892d13393a8a5b360b8a109f3d809600919684a600ff60ei0',
  'm/mohawk'  =>   '5ce9f89ad571e5380baa5b5ee387f08ea313421e7e54662b3899d411c39321ddi0',

  'm/hoodie'  => 'aab67a4269ca0bda649fe341bd88c862aba2e9bf6e0826b9dfa5c4ba8fe62c2di0',
  'm/cowboy_hat' => '5dcf96b13e5762d5a288d8bee36deb933fe192a55475199fe9a39ae29dd16853i0',
  'm/beanie'  =>  '0f473c9dcd14e3f43a6599b038d810eac16bc6394edcfcf6b32f8df992ab6791i0',
  'm/cap_forward' => '0bd902941392ea138adb7db30cecdf5bc09a92c80e3e1bc3ecdf3c2d0abf6631i0',

  'm/cap'  => '5760ce05009e94a750a7245cac994fa9ffd388eadc757929ac17737811455429i0',

  'm/dorag' => 'd32c50c23693a028e2381d6f756746a9ff684f2028edf694ab7b1b6cde78e2cdi0',
  'm/medical_mask' => '87d89d290ebde5d5b7aa75b4c8d0359515e25ea1542bc0646dc3f5b0b2fc55fdi0',
  'm/goldchain' => '8043604c7c96a5a43a97e251b246102ca40c0203431ff21bd26f23330dfa554ci0',

   ## backgrounds
  'background_bitcoin-orange' => '189b02ffc8aac68a45102e9837a1ca92e422bf5544d9011a863626cf6b0abeeai0',
  'background_bitcoin-pattern' => '43e93e43f2dac75b141baaa5b08df440e0b6ec5755577a9554a7af6540447bb7i0',
  'background_red' => '39d774f7d7514371c88bc4f939346f6b23000c9892ac4ae8ea36c76694e3b842i0',
  'background_green' => 'b268b2acccd6b04680c2aa3130863ffbaa450f6870f100af678428cd07212ef6i0',
  'background_dollar-pattern' => 'ac810c9098681e100964166b7510d1ac371c147861b0ae2a862da3a8b8256037i0',
  'background_blue' => '4b9f880df07b072a4147a62acdd0881d024d14da6d84174db9b5ac555b71b346i0',
  'background_aqua' => '014ad6ed6297bc4ed624b2856e036c6bde115d51eb7200b14e3b3413ad53db08i0',
  'background_classic' => 'e139b5b0649186772cbf044bb8d3c5e43b77e3cf0472008ce2aaf52966c921eci0',
  'background_rainbow' => '6eb271ad3fdd15cc2ec34dda462e71aaa8a7ef7e306cfd189931ef37216a9c60i0',
  'background_ukraine' => '47cb34f1d73371df0b27ca0a259927fa80e2b2d9ee0e1d487fca5c9029b67b49i0',

}


pp inscribes



inscribes.each_with_index do |(name,id), i|

  puts "==> #{i} - #{name} @ #{id}..."

   ## note: assume png - double check?

   path = "./tmp/martians/#{name}.png"
   force = false  ## download & overwrite if exists


   if force == false && File.exist?( path )
      puts "  #{name} in cache"
   else
     content = Ordinals.content( id )
     pp content
     #=> #<Ordinals::Api::Content:0x000001a1352df938
     #      @data="RIFF\xF8\v\x00\x00WEBPVP8 \xEC\v\x00\x00...",
     #      @length=3072,
     #      @type="image/png"

     puts "data:"
     puts content.data

     write_blob( path, content.data )

     sleep( 0.5 )
   end
end



###
## assemble into spritesheet

attributes =
[
  'orange'    ,
  'gold'      ,
  'cybergreen',
  'deepblue',
  'midnight',
  'magenta',
  'marsred',

  'm/mohawk',
  'smile',         ## add smile up here - why?
  'm/spots',


  'm/bandana',
  'm/headband',
  'm/tophat',
  'm/cowboy_hat',
  'm/cap',
  'm/cap_forward',
  'm/knitted_cap',
  'm/beanie',
  'm/dorag',

  'm/nerd_glasses',
  'm/vr',
  'm/3d_glasses',
  'm/eye_mask',
  'm/regular_shades',
  'm/small_shades',
  'm/horned_rim_glasses',
  'm/eye_patch',

  'nounie',  # red-ish (small)
  'noun1',   # red-ish
  'noun2',   # blue-ish
  'noun3',   # rgb

  'lasereyes',
  'lasereyes-gold',
  'lasereyes-blue',


  'm/earring',
  'm/goldchain',

  'm/pipe',
  'm/cigarette',
  'm/medical_mask',

  'm/hoodie',



  'background_bitcoin-orange',
  'background_bitcoin-pattern',
  'background_red',
  'background_green',
  'background_dollar-pattern',
  'background_blue',
  'background_aqua',
  'background_classic',
  'background_rainbow',
  'background_ukraine',
]


puts "  #{attributes.size} attribute(s)"


composite = ImageComposite.new( 10, 5, width: 24,
                                       height: 24 )

attributes.each do |name|
  path = "./tmp/martians/#{name}.png"
  img = Image.read( path )
  composite << img
end


composite.save( "./tmp/martians/spritesheet.png" )
composite.zoom(4).save( "./tmp/martians/spritesheet@4x.png" )
composite.zoom(8).save( "./tmp/martians/spritesheet@8x.png" )



###
## assemble generative array (jsom)

data = []
attributes.each do |name|
  id = inscribes[name]

  if id.nil?
    puts "!! ERROR - inscribe for >#{name}< not found; sorry"
    exit 1
  end

  data << id
end


puts "  #{data.size} id(s) in generative:"
pp data

write_json( "./tmp/martians/generative.json", data )


puts "bye"
