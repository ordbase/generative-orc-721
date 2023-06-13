require 'ordinals'
require 'pixelart'


##############################
#   d.i.y. alien (attribute) inscribes

inscribes =
[
##  ['base', '81ec4177e7fce4e568cc1c14366fe29deb88b0f0841eb12d4f1d0638cca68201i0'],

## female?
##  ['f/3d_glasses', '0182710716a6706aa1aadcdf06d6f33a4edac1c2f86d2c9f5e0f2d1ca0ec3ee9i0'],
##  ['f/bandana', '44d6266aea36dd0dddaa57498a5f3658ad16cf888089905e72d3683b0366e086i0'],
##  ['f/regular_shades', 'b1d98f466e0b2aec940f2981b9c67a5d862871b5fad677a4e674aac36090b038i0'],
##  ['f/cap', '5760ce05009e94a750a7245cac994fa9ffd388eadc757929ac17737811455429i0'],


## male??
['m/pipe',         '92e7f48454546718f98103d7464d954033adbee21855f06584be06faa3e291ddi0'],
['m/cigarette',    'a01012b213ed425c5d4038bc36016f19f4f342ca052ff9bf6971672164e1a402i0'],

['m/nerd_glasses', 'd61fc2a89ecc6ae65cf91cdfac9edc37fd60c38621dac211f3a70891ef79b69ai0'],
['m/vr',           '680e2ee8cad86aa174b4f3373d733370c9a6fc4230b9708d520a0f6bcb8e72a6i0'],
['m/3d_glasses',   '56d3f4f661b2b4a9fc17755171d7cf4da74e570614b6b45de0cc87a809c3eb3ci0'],
['m/eye_mask',     'fe4321178bd841e52fdeb72ce4456c5b7596c0d611b19da15ba75ec63b5314cai0'],
['m/regular_shades', 'eddc1242f0fd290e130332e046897ad41dce1e7e112df48ecf2168e43172d383i0'],
['m/small_shades', 'a2110fb4afaa29bc70bcfac445f750ecb5e81777e8d080be2d2b07eb030ba0ffi0'],
['m/horned_rim_glasses', 'c1277df4b986067b2a3f006d717b7f6d042896840c8b592e5a8b9ff22444b08fi0'],
['m/bandana', 'a6b4b81f69e8c217db24f0a71954195d67ced49a819b67a4daf9f3ca7fa1b971i0'],
['m/earring', '06136a5b4fb585069ef6265a0fde3baf67ee914b9f784d2c951f3a8187800d54i0'],
['m/spots',   '1355524a2aab576e069bac91227b0e52d227d65d84c5535377d3a0ea4e44d470i0'],
['m/knitted_cap', '7c2fd41b52624ddb1ba11fe1c6d95475f2e42c4b53d6aaf6a16a09064acebe38i0'],
['m/headband', '83827ec13cb55a35fe3adca5acf67caf943c3bd6810f8fa893b067e8015c8f19i0'],
['m/tophat', '5b1e638c050318bec23f17b8b7758ccf13945e422516da6c722c67ae5ed4e26di0'],
['m/eye_patch', '722dfdc90a67ff7eb892d13393a8a5b360b8a109f3d809600919684a600ff60ei0'],
['m/mohawk',   '5ce9f89ad571e5380baa5b5ee387f08ea313421e7e54662b3899d411c39321ddi0'],

['m/hoodie', 'aab67a4269ca0bda649fe341bd88c862aba2e9bf6e0826b9dfa5c4ba8fe62c2di0'],
['m/cowboy_hat', '5dcf96b13e5762d5a288d8bee36deb933fe192a55475199fe9a39ae29dd16853i0'],
['m/beanie',  '0f473c9dcd14e3f43a6599b038d810eac16bc6394edcfcf6b32f8df992ab6791i0'],
['m/cap_forward', '0bd902941392ea138adb7db30cecdf5bc09a92c80e3e1bc3ecdf3c2d0abf6631i0'],
['m/cap', 'c60989760670968c917f8c19a49a09d9f163345bd1a1c61e9700415f67a0e96ci0'],
['m/dorag', 'd32c50c23693a028e2381d6f756746a9ff684f2028edf694ab7b1b6cde78e2cdi0'],
['m/medical_mask', '87d89d290ebde5d5b7aa75b4c8d0359515e25ea1542bc0646dc3f5b0b2fc55fdi0'],
['m/goldchain', '8043604c7c96a5a43a97e251b246102ca40c0203431ff21bd26f23330dfa554ci0'],


]





inscribes.each do |rec|
   name = rec[0]
   id   = rec[1]


   ## note: assume png - double check?

   path = "./tmp/aliens/#{name}.png"

   if File.exist?( path )
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
  'base',
  'm/mohawk',
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

  'm/earring',
  'm/goldchain',

  'm/pipe',
  'm/cigarette',
  'm/medical_mask',

  'm/hoodie',
]


puts "  #{attributes.size} attribute(s)"

composite = ImageComposite.new( 10, 3, width: 24,
                                       height: 24 )

attributes.each do |name|
  path = "./tmp/aliens/#{name}.png"
  img = Image.read( path )
  composite << img
end


composite.save( "./tmp/aliens/spritesheet.png" )
composite.zoom(4).save( "./tmp/aliens/spritesheet@4x.png" )
composite.zoom(8).save( "./tmp/aliens/spritesheet@8x.png" )

puts "bye"
