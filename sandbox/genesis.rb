require 'ordinals'
require 'pixelart'


cache_dir = '../../ordinals.cache/btc'



inscribes = {
# 0  Bonus - Bitcoin Orange
  '000-background_orange' => '189b02ffc8aac68a45102e9837a1ca92e422bf5544d9011a863626cf6b0abeeai0',  

  # 1   Male 1
  '001-male_1' => '9d6afbc158e983735e563426981608ea63432619fab468c835322ea30a126c47i0', 
# 2   Male 2
  '002-male_2' => '5ce8fa4973d47e5adc92be4587a02b12c553d202188ca0f2ee0c74356c368ea4i0',
# 3   Male 3
   '003-male_3' => '0f635374c2f60a7e34e2eb731bce23a5bc44d3a112ad02aceb23ea42606f6992i0',
# 4   Male 4 
   '004-male_4' => '3e6e56b4fab6821bcd0c8baf590cf6217e7ec723f643abf809928cfd932fa08bi0',  
# 5   Female 1
   '005-female_1' => '2cdcb5bfa63ca686543932c2214e4c6e04a856834ad516353bd5f1440bca5fd6i0',
# 6     Female 2
   '006-female_2' => '7fbfed7e38bbcaf851c2c4426b4c4ede9d09b6e6fd87a040403852681c7c19c2i0',
# 7   Female 3 
   '007-female_3' => '5c8ab9ad57057e276f7b31e4e2a32d35e16c4fdda4b9070ddc57df23eb66518ai0',  
# 8   Female 4 
   '008-female_4' =>  'e7965554a5783f9e25ea0117a066dafe052cd5896c462bc2520a37f757f5e37fi0',
# 9   Zombie 
   '009-zombie' =>  '1eb344bb1343de17a4bf5f8e11153d512362abb44458f6af0f6266025a8ac961i0',  
# 10   Ape
  '010-ape'  => 'b36750a6b444e3815f0cbb50a36e0f1231b74ba930855b1e9067f907942f34fci0',
# 11   Alien 
  '011-alien' => '81ec4177e7fce4e568cc1c14366fe29deb88b0f0841eb12d4f1d0638cca68201i0',
# 12    Rosy Cheeks (m)
   '012-rosy_cheeks' => 'fa1b6b749e5769f18298a54109d88bef08b2b7a851e993d2b95f39c80c27e9ffi0',
# 13   Luxurious Beard (m)  
   '013-luxurious_beard' => '06ec577092baf39d78e4fceff71168f23687059d2a7046b5ef4012f5592a702ei0',
# 14    Clown Hair Green (m)
   '014-clown_hair_green' =>  '843a5269d45ed9864f70b821bef10c56302d31f0860c090ce5ae9bc39af84b57i0',
# 15     Mohawk Dark (m)
     '015-mohawk_dark' => '5ce9f89ad571e5380baa5b5ee387f08ea313421e7e54662b3899d411c39321ddi0',
# 16  Cowboy Hat (m) 
   '016-cowboy_hat' => '5dcf96b13e5762d5a288d8bee36deb933fe192a55475199fe9a39ae29dd16853i0',
# 17   Mustache (m) 
    '017-mustache' => '88c2a6594a4aed4d8d5cd6b5cafde85951942a1451f884eaa620e50245f56c2ci0',
# 18   Clown Nose (m)
    '018-clown_nose' => '00e698907dcb84c5ce3d1dbc22e88309aa7f288cff3d608c53ed3eea6af9bc04i0',
# 19    Cigarette (m) 
    '019-cigarette' => 'a01012b213ed425c5d4038bc36016f19f4f342ca052ff9bf6971672164e1a402i0',
# 20   Nerd Glasses (m)
  '020-nerd_glasses' => 'd61fc2a89ecc6ae65cf91cdfac9edc37fd60c38621dac211f3a70891ef79b69ai0',
# 21   Regular Shades (m)
  '021-regular_shades' => 'eddc1242f0fd290e130332e046897ad41dce1e7e112df48ecf2168e43172d383i0',
# 22    Knitted Cap (m)
  '022-knitted_cap' => '7c2fd41b52624ddb1ba11fe1c6d95475f2e42c4b53d6aaf6a16a09064acebe38i0',
# 23    Shadow Beard (m) 
   '023-shadow_beard' => 'ab01abac3faa712440d16d0a7739122340aa35f01d1423ec173ca1cbc7f9bcebi0',
# 24    Frown (m)
   '024-frown' => 'b65e4184c574fd6412a0a2e6ada97fb83a61343ea0bb238a3292277f3301093ai0',
# 25    Cap Forward (m) 
   '025-cap_forward' => '0bd902941392ea138adb7db30cecdf5bc09a92c80e3e1bc3ecdf3c2d0abf6631i0',
# 26    Goat (m) 
   '026-goat' => 'ed12dd62eb50048ea180f82bb6505abbece41156125bcfdfb1adfcfefd4bbbd8i0',
# 27     Mole (m)
   '027-mole' => '26dcfd2595fd5b705a9227664577fc1beae412c8842f2dcc23de40408ea6b83ci0',
# 28    Purple Hair (m) 
   '028-purple_hair' => 'db0dd1952c0cdad6f1c7a0ffedd7c395a71818e73a33276709ab666f240034f2i0',
# 29    Small Shades (m)
  '029-small_shades' => 'a2110fb4afaa29bc70bcfac445f750ecb5e81777e8d080be2d2b07eb030ba0ffi0',
# 30      Shaved Head (m)
   '030-shaved_head' => '05fc9a15e179fa0765cfe2ed2f52112265377587cab9f227afc10100f0e72dd1i0',
# 31       Classic Shades (m) 
   '031-classic_shades' => 'c36f12e655ab8af8bdd5c53a5bcb9eb758c2e33722f2e6cd932845ae93de143fi0',
# 32      Vape (m) 
   '032-vape' => '7fc6c3e00f952b4337100eeaedf74acf383600e67e16f11f48fdf5ba27601545i0',
# 33     Silver Chain (m) 
   '033-silver_chain' => 'cfc82aeb0ad4a25a43cba1bc76b44070a09017c94382986e0b3d55894d247571i0',
# 34   Smile (m) 
   '034-smile' => 'f11caf409e98e30c74b79315cb1fe402cd613f3cb0266efa65b16cc5b5038629i0',
# 35    Big Shades (m)  
   '035-big_shades' => '2e171b73b8837b55913b6be6004a9ad78be49778edf1642f826deac67ec7b18ai0',
# 36    Mohawk Thin (m)
  '036-mohawk_thin' => '209b83728679c0b3cda44301d482db34844dec3b7e873f58521d2f22b4820f5ci0',  
# 37    Beanie (m) 
  '037-beanie' => '0f473c9dcd14e3f43a6599b038d810eac16bc6394edcfcf6b32f8df992ab6791i0',
# 38  Cap (m) 
  '038-cap' => '5760ce05009e94a750a7245cac994fa9ffd388eadc757929ac17737811455429i0',
# 39    Clown Eyes Green (m) 
   '039-clown_eyes_green' => 'd9317eeee2c7f2f70dac1865c2c3a68a249898f09cb5c03f4723af48d7338009i0',
# 40    Normal Beard Black (m) 
   '040-normal_beard_black' => '3bd7aa44570f9f7e51af070240fbb930d135310b67d408b719de11b6f20f4b54i0',
# 41   Medical Mask (m) 
   '041-medical_mask' => '87d89d290ebde5d5b7aa75b4c8d0359515e25ea1542bc0646dc3f5b0b2fc55fdi0',
# 42   Normal Beard (m) 
   '042-normal_beard' => 'efc6a4699c2cee6f305c72911df16a3dcf29fe75913b007607f175339485bf78i0',
# 43   VR (m)
   '043-vr' => '680e2ee8cad86aa174b4f3373d733370c9a6fc4230b9708d520a0f6bcb8e72a6i0',
# 44   Eye Patch (m)
   '044-eye_patch' =>  '722dfdc90a67ff7eb892d13393a8a5b360b8a109f3d809600919684a600ff60ei0',
# 45    Wild Hair (m)
   '045-wild_hair' => '9ec48f049d522a800cb880aa1b1adf807c9d3cf4e670bb4ebfeac49336b25993i0',
# 46     Top Hat (m)
   '046-top_hat' => '5b1e638c050318bec23f17b8b7758ccf13945e422516da6c722c67ae5ed4e26di0',
# 47    Bandana (m)
   '047-bandana' => 'a6b4b81f69e8c217db24f0a71954195d67ced49a819b67a4daf9f3ca7fa1b971i0', 
# 48     Handlebars (m)
   '048-handlebars' => 'fad503c753b8da8c758f1bbc6fd60810397ae61eeffcc8a68964eae3f3ff46bei0',
# 49   Frumpy Hair (m)
  '049-frumpy_hair' => '43815da95ee418d61a29dd2afdefd8666549b8e23dfa0ceb4eda354466a8b3f7i0',
# 50    Crazy Hair (m) 
   '050-crazy_hair'  => '78c1d952d2b2be42955931ed2718611879fa86c9b44b94801cdd5b7325a09642i0',
# 51    Police Cap (m) 
   '051-police_cap' => 'cfc76dd5d7e5a5677f4d5cb142484385b71478aa4e5abe62be58ccd75125bd87i0',
# 52     Buck Teeth (m) 
   '052-buck_teeth' => 'c4a74e192d70125886d39adb80ac8e321b61340446fa640c9fcd69d35aba0d0bi0',
# 53      Do-rag (m)
   '053-do-rag' => 'd32c50c23693a028e2381d6f756746a9ff684f2028edf694ab7b1b6cde78e2cdi0',
# 54    Front Beard (m) 
   '054-front_beard' => 'b6c86723ef53a39cb1e40b315b167f1c9be0c841dfa2af31bb933c8164885166i0',
# 55    Spots (m)
   '055-spots' => '1355524a2aab576e069bac91227b0e52d227d65d84c5535377d3a0ea4e44d470i0',
# 56  Big Beard (m)
   '056-big_beard' => '8a4cb95de8d0928eb0fc20228cc678a2ae816ac92ff3a021569b6dc52a3b6d26i0',
# 57     Vampire Hair (m) 
   '057-vampire_hair' => 'dc87795fdc400deda9bf8b18fda3281fa951d9ba1064608ea735c62193ecc0eei0',
# 58   Peak Spike (m) 
    '058-peak_spike' => '9a75e2def0674d4ea8a49e80ba4474f5c932ae305b21eeb4fcc11bc1a495aa9di0',
# 59    Chinstrap (m) 
    '059-chinstrap' => '618feda25d835adaf1e551883a014165a55c2a4ab4eb5e6e9bcd5cd18a5acc29i0',
# 60     Fedora (m) 
    '060-fedora' => 'e6ebc3556df14856a42307337af8169f5924c36cefbc2516162956448963d302i0',
# 61    Earring (m) 
   '061-earring' => '06136a5b4fb585069ef6265a0fde3baf67ee914b9f784d2c951f3a8187800d54i0',
# 62   Horned Rim Glasses (m) 
   '062-horned_rim_glasses' => 'c1277df4b986067b2a3f006d717b7f6d042896840c8b592e5a8b9ff22444b08fi0',  
# 63     Headband (m)
    '063-headband' => '83827ec13cb55a35fe3adca5acf67caf943c3bd6810f8fa893b067e8015c8f19i0',
# 64    Pipe (m)
    '064-pipe' => '92e7f48454546718f98103d7464d954033adbee21855f06584be06faa3e291ddi0', 
# 65     Messy Hair (m)
    '065-messy_hair' => '397a319d4730b6ac665cc4dce0ae54aa2a6aa73e0b16462d35379756e04d8b5fi0',
# 66   Front Beard Dark (m)  
  '066-front_beard_dark' => 'ad215dab98dad21577cbfe87c9d1d28790235e60ad281681932da33a38de3380i0',
# 67    Hoodie (m)
  '067-hoodie' =>  'aab67a4269ca0bda649fe341bd88c862aba2e9bf6e0826b9dfa5c4ba8fe62c2di0',
# 68     Gold Chain (m) 
  '068-gold_chain' => '8043604c7c96a5a43a97e251b246102ca40c0203431ff21bd26f23330dfa554ci0',
# 69     Muttonchops (m) 
   '069-muttonchops' => 'beea23b3036f39373e5eaadbedd6d0c196fdcd0a42b8a468ba67a176284d88e0i0',
# 70     Stringy Hair (m)
   '070-stringy_hair' => 'b7f370684042d2a77dba26128002c2a691b06acef01b5e274afa2588c6a3b8b1i0',
# 71  Eye Mask (m)
  '071-eye_mask' => 'fe4321178bd841e52fdeb72ce4456c5b7596c0d611b19da15ba75ec63b5314cai0',
# 72   3D Glasses (m) 
  '072-3d_glasses' => '56d3f4f661b2b4a9fc17755171d7cf4da74e570614b6b45de0cc87a809c3eb3ci0',
# 73    Clown Eyes Blue (m) 
   '073-clown_eyes_blue' => 'f9918b7b3b4df1c13ea73c2461f96b5e5d3b3986e6662ca90048728905c33644i0',
# 74     Mohawk (m)
  '074-mohawk' =>  '5ce9f89ad571e5380baa5b5ee387f08ea313421e7e54662b3899d411c39321ddi0',

# 75   Pilot Helmet (f) 
  '075-pilot_helmet' => '67fb724fb5a68a211563d26db70847996171347d469ccda5e9a8413c45110c3bi0',
# 76    Tassle Hat (f) 
   '076-tassle_hat' => 'c351991ae33651382e7e7eb6b53421010b52ea11a83fa8bc152ba7737d4c5b58i0',
# 77    Hot Lipstick (f) 
   '077-hot_lipstick' => 'db16546971fbdeb7b2f21ee78a0328a1e82ce8f0d04bc93577e11ec31f498d53i0',
# 78     Blue Eye Shadow (f)
      '078-blue_eye_shadow' => 'f017611844cf5c520709e68cd9517b69c6e023ee1b8c279f53be2d802589362ei0',
# 79     Straight Hair Dark (f) 
   '079-straight_hair_dark' => 'dfe116659af5477a9d8829458ddb7cced761a48432c9f213b3c02eb3e67ac15fi0',
# 80     Choker (f)  
  '080-choker' =>  '31c3c1ace7c8863d36447357d87ba3144fbfbc8f742ce297cffb35b836d806dei0',
# 81    Crazy Hair (f) 
   '081-crazy_hair' => '2afedce7036f463eab5a8e1c4ba67093282617b4bd09f12ae0eab472d93aa764i0',
# 82     Regular Shades (f)
   '082-regular_shades' => 'b1d98f466e0b2aec940f2981b9c67a5d862871b5fad677a4e674aac36090b038i0',
# 83    Wild Blonde (f) 
   '083-wild_blonde' => '819fc98314103dae2a8e8dbf04c4ef1f5fc54d821f6f0d509eb11192e443ede5i0',
# 84    3D Glasses (f)
   '084-3d_glasses' => '0182710716a6706aa1aadcdf06d6f33a4edac1c2f86d2c9f5e0f2d1ca0ec3ee9i0',
# 85    Mole (f)
   '085-mole' => '69ce22bcdfa9d0748ba28c9a73e2e1b3370cc343db658ccb5abab4653e1a4c3ei0',
# 86   Wild White Hair (f) 
  '086-wild_white_hair' => '5654174cfa3f55e85d8d2a5e5f35fd1bb309a856575b389bf19e9fde48e6688bi0',
# 87    Spots (f) 
   '087-spots' => 'd885d809a41928f4780ba80a654e7b4cd8668c6f416aa5fcb85f8a4ce2570d51i0',
# 88    Frumpy Hair (f) 
  '088-frumpy_hair' => 'e32b247314acc6e86db01937f1ae898e1bbb0eda642eb1167a9b10899948db13i0',
# 89    Nerd Glasses (f) 
   '089-nerd_glasses' => 'b0e600e963663d2ee03593c0815980f0749c8a61eeefda0934abf9ca6ddcf2a5i0',
# 90   Tiara (f) 
  '090-tiara' => '06729443440c4509d9022733a2eb9c747a1b42b11dae87832e64c339053ccc3ei0',
# 91  Orange Side (f) 
   '091-orange_side' => '1e3bc62905a0e33616b8f963dce8ad0fcd3fea36006842559ee76bfd0257cfb0i0',
# 92    Red Mohawk (f)  
   '092-red_mohawk' => '35ca91997926f23bbe18617fb6921a2002950881e365f3c3e408a22e926930f9i0',
# 93   Messy Hair (f) 
   '093-messy_hair' => '97a7e1262423b72d43661162a5189336048a8a9cc774f7da0ab06a7ef2f9d33fi0',
# 94  Clown Eyes Blue (f) 
   '094-clown_eyes_blue' => '2934660e11441092b9d417940b55287e61af159bc8a6cc1cb51000fa1652d6fai0',
# 95   Pipe (f) 
   '095-pipe' => 'adc7696e06074d3a60599c2e4be79c5b2ad2303fe109bc04d904c17a0290960ci0',
# 96    Wild Hair (f) 
  '096-wild_hair' => 'bd2cad95a86c1c0fb99f69ec590f188ebbf6c76be34733170c5df987829885a7i0',
# 97    Purple Eye Shadow (f) 
   '097-purple_eye_shadow' => '70223379cf57ade54b3f00f3ac6491134907d7d3bcebbc10425a64d99dbc5aaai0',
# 98    Stringy Hair (f) 
    '098-stringy_hair' => '7e017509d3c6680ffbd30c1f23b4fbfa164fe36688399e9e0bea367ef249698fi0',
# 99   Dark Hair (f)
  '099-dark_hair' => '0a11009d48145138ef83068a3a4b59e1563edc67b49a5db0b2aede0b011bb7a3i0',
# 100  Eye Patch (f)  
   '100-eye_patch' => 'dc0422975f31d1eeca13c7fc6d09936c5d5217e5e8eaf94ef098a2d7b95ca19fi0',
# 101    Blonde Short (f) 
   '101-blonde_short' => '02c4827b2c8e74b66f71c610bb371873fca6bd4b5f63adfaa155142a00f184aei0',
# 102    Classic Shades (f) 
   '102-classic_shades' => 'f78db6fc25af28938730f3e821a4ef9d0bb74316acda28f7ab378dfd19f41ff9i0',
# 103   Eye Mask (f) 
   '103-eye_mask' => '13df620523bd9b08d5dd63d974493c534d0d93fb830509bb347c39168ad9196ei0',
# 104     Clown Hair Green (f)
   '104-clown_hair_green' => '20a76349f16c4dbfd1aca99c2e457ce26a3be7160afd796560764bf1910d2ccfi0',
# 105   Cap (f)
   '105-cap' => 'c60989760670968c917f8c19a49a09d9f163345bd1a1c61e9700415f67a0e96ci0', 
# 106   Medical Mask (f)
   '106-medical_mask' => 'be3bd4dd617160a8fda77bf745b0272020dba3223092ce08a049cd2c0838545fi0',  
# 107   Bandana (f)
    '107-bandana' => '44d6266aea36dd0dddaa57498a5f3658ad16cf888089905e72d3683b0366e086i0',
# 108   Purple Lipstick (f) 
    '108-purple_lipstick' => '02959b0904f61acda9419c2bb82ec3158fa97a0478d41d5150cfdc4e10a8b37bi0',
# 109    Clown Nose (f) 
    '109-clown_nose' => '06b795f679e528e9fd0fd83ea7a322cff39bf131a0836bda5ac9c0f95876a768i0',
# 110     Headband (f)
   '110-headband' => 'ebca54ddbcd9da94b9bbcde11a1924becb3076d3500aa08170e2d147ae5c9700i0',
# 111    Pigtails (f) 
  '111-pigtails' => '28031a5a4d1977b911727e832c7f2382f0fe2f510cdcda5eaab1eddd5b746b51i0',
# 112    Straight Hair Blonde (f)
  '112-straight_hair_blonde' => '5c540d6a565f4024abcaf0b1577f43cf2dcd5f30c3f3e61dcb144dc1c5123f82i0',
# 113   Knitted Cap (f)
  '113-knitted_cap' => '3daaa3ec7e365f8cd81a042b724513035a4b80c031c9b14f74bfedaa0150e924i0',
# 114   Clown Eyes Green (f) 
   '114-clown_eyes_green' => '77d25521fcd8808742078dad2ae5f2cad9751187c72ee164cef72c95388f934di0',
# 115   Cigarette (f)
   '115-cigarette' =>  '35588d7e4cb81c5b4e56e7f9610a307766b543b91a7fb2a326e558d7555e6ce5i0',
# 116   Welding Goggles (f) 
   '116-welding_goggles' => '5e0f701a232a83f1db21aaadb32f3495fd4296cdf1d2c406ec633ce2039e000bi0',
# 117   Mohawk Thin (f) 
   '117-mohawk_thin' => '22f9268120bb2396e25e57020fb4e831bc64fdfb3c27935986a7fe7cc28c6ecei0',
# 118     Gold Chain (f) 
    '118-gold_chain' => '82fe12aee4bfd8098406119be59ade336a5b5887a81e73c27cf5c6aaba9cf3fbi0',
# 119    VR (f)
    '119-vr' => 'b469a89182008c0e80aafc6dfc02a6cb76615ea42838a7ab989cf51ff1be8de1i0', 
# 120   Vape (f)
    '120-vape' => '14462ca5a4d237976d85271792a7dc13f8a15c359e9113f8b5e4bd7d711cd7bbi0',
# 121   Pink With Hat (f) 
   '121-pink_with_hat' => 'd0adcf57f93c917c0e8e37463d8389fef46067edb261f725a9c21acaf1848b61i0',
# 122     Blonde Bob (f) 
   '122-blonde_bob' => '62ec589582651e49ed722241dab3bdb93fbd8ddf3fab3d891a30165126dddbcfi0',
# 123    Mohawk (f) 
   '123-mohawk' => 'ede175a2f54c30680c9a30734977fb8955c24703cce8d833d45fd6239cb10e30i0',
# 124    Big Shades (f) 
   '124-big_shades' => 'bf69af3d246da90d01a9acfe66b6bc3eb3365091f6eb6228186716d8c6ff17e8i0',
# 125    Earring (f)
    '125-earring' => '128d1e42f85e67d2a6b0c4c78e9ad47f7d66ed7699e77ddd0a4f0b8a21cdf736i0',  
# 126    Green Eye Shadow (f) 
    '126-green_eye_shadow' => 'b866e8f3f51c385a3ae27e65c5abe68e6086a6b74935b1b692de8587f5858148i0',
# 127    Straight Hair (f) 
    '127-straight_hair' => '64c2890470ab4aea80c368b12fa0f416abc3da321b9e3c6940f211d9635db25di0',
# 128    Rosy Cheeks (f)
    '128-rosy_cheeks' => 'd555588738cda6bcf03b9b7b5f66968fe945bd293a714d652e262f80f6829c43i0',  
# 129   Half Shaved (f) 
    '129-half_shaved' => '2f5706f049c004c5dbefd4ef339de573ba41790572250b9a3558f16ac14702cdi0',
# 130     Mohawk Dark (f) 
    '130-mohawk_dark' => 'd57f77b3eb7d5c4412bdc86deebc96a67517c27dcc6d6119fec1ba33f0367862i0',
# 131    Black Lipstick (f) 
     '131-black_lipstick' => '2c4805e4015048cbdde22593c7b2c475889aa5b6bb433a17875892a0c507de28i0',
# 132   Horned Rim Glasses (f)
    '132-horned_rim_glasses' => '4c609e34152da749b68d5b281aba5d23e163d17283dd52dc77d4292dab8ebf77i0',
# 133   Silver Chain (f) 
   '133-silver_chain' => 'e047590efef1e16b6e74a883835949b13b1921eb8587cee20dc4056c39be4b6ci0',
}


pp inscribes



inscribes.each_with_index do |(name,id), i|

    if id.empty?
       puts  "!! ERROR - required inscription id for >#{name}< missing"
       exit 1
    end
 
  puts "==> #{i} - #{name} @ #{id}..."

   ## note: assume png - double check?

   path = "./tmp/genesis/#{name}.png"
   force = false  ## download & overwrite if exists


   if force == false && File.exist?( path )
      puts "  #{name} content in cache"
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


   ## get meta data for inscribe nums
   meta_path = "#{cache_dir}/#{id}.json"
   force = false  ## download & overwrite if exists


   if force == false && File.exist?( meta_path )
      puts "  #{name} meta in cache"
   else
      ## fetch and cache in cache
      meta = Ordinals.inscription( id )
      pp meta
 
      write_json( meta_path, meta )
 
      sleep( 0.5 )
   end
end


labels = [
 'Bonus! Bitcoin Orange Backgroud', 
 'Male 1',
 'Male 2',
 'Male 3',
 'Male 4',
 'Female 1',
 'Female 2',
 'Female 3',
 'Female 4',
 'Zombie',
 'Ape',
 'Alien',
 'Rosy Cheeks (m)',
 'Luxurious Beard (m)',
 'Clown Hair Green (m)',
 'Mohawk Dark (m)',
 'Cowboy Hat (m)',
 'Mustache (m)',
 'Clown Nose (m)',
 'Cigarette (m)',
 'Nerd Glasses (m)',
 'Regular Shades (m)',
 'Knitted Cap (m)',
 'Shadow Beard (m)',
 'Frown (m)',
 'Cap Forward (m)',
 'Goat (m)',
 'Mole (m)',
 'Purple Hair (m)',
 'Small Shades (m)',
 'Shaved Head (m)',
 'Classic Shades (m)',
 'Vape (m)',
 'Silver Chain (m)',
 'Smile (m)',
 'Big Shades (m)',
 'Mohawk Thin (m)',
 'Beanie (m)',
 'Cap (m)',
 'Clown Eyes Green (m)',
 'Normal Beard Black (m)',
 'Medical Mask (m)',
 'Normal Beard (m)',
 'VR (m)',
 'Eye Patch (m)',
 'Wild Hair (m)',
 'Top Hat (m)',
 'Bandana (m)',
 'Handlebars (m)',
 'Frumpy Hair (m)',
 'Crazy Hair (m)',
 'Police Cap (m)',
 'Buck Teeth (m)',
 'Do-rag (m)',
 'Front Beard (m)',
 'Spots (m)',
 'Big Beard (m)',
 'Vampire Hair (m)',
 'Peak Spike (m)',
 'Chinstrap (m)',
 'Fedora (m)',
 'Earring (m)',
 'Horned Rim Glasses (m)',
 'Headband (m)',
 'Pipe (m)',
 'Messy Hair (m)',
 'Front Beard Dark (m)',
 'Hoodie (m)',
 'Gold Chain (m)',
 'Muttonchops (m)',
 'Stringy Hair (m)',
 'Eye Mask (m)',
 '3D Glasses (m)',
 'Clown Eyes Blue (m)',
 'Mohawk (m)',
 'Pilot Helmet (f)',
 'Tassle Hat (f)',
 'Hot Lipstick (f)',
 'Blue Eye Shadow (f)',
 'Straight Hair Dark (f)',
 'Choker (f)',
 'Crazy Hair (f)',
 'Regular Shades (f)',
 'Wild Blonde (f)',
 '3D Glasses (f)',
 'Mole (f)',
 'Wild White Hair (f)',
 'Spots (f)',
 'Frumpy Hair (f)',
 'Nerd Glasses (f)',
 'Tiara (f)',
 'Orange Side (f)',
 'Red Mohawk (f)',
 'Messy Hair (f)',
 'Clown Eyes Blue (f)',
 'Pipe (f)',
 'Wild Hair (f)',
 'Purple Eye Shadow (f)',
 'Stringy Hair (f)',
 'Dark Hair (f)',
 'Eye Patch (f)',
 'Blonde Short (f)',
 'Classic Shades (f)',
 'Eye Mask (f)',
 'Clown Hair Green (f)',
 'Cap (f)',
 'Medical Mask (f)',
 'Bandana (f)',
 'Purple Lipstick (f)',
 'Clown Nose (f)',
 'Headband (f)',
 'Pigtails (f)',
 'Straight Hair Blonde (f)',
 'Knitted Cap (f)',
 'Clown Eyes Green (f)',
 'Cigarette (f)',
 'Welding Goggles (f)',
 'Mohawk Thin (f)',
 'Gold Chain (f)',
 'VR (f)',
 'Vape (f)',
 'Pink With Hat (f)',
 'Blonde Bob (f)',
 'Mohawk (f)',
 'Big Shades (f)',
 'Earring (f)',
 'Green Eye Shadow (f)',
 'Straight Hair (f)',
 'Rosy Cheeks (f)',
 'Half Shaved (f)',
 'Mohawk Dark (f)',
 'Black Lipstick (f)',
 'Horned Rim Glasses (f)',
 'Silver Chain (f)',
]



##  "title": "Inscription 9992615",

TITLE_RX = /^Inscription (?<num>[0-9]+)$/i

def title_to_num( str )
   if m=TITLE_RX.match( str )
      m[:num].to_i(10)    ## use base 10
   else
     nil   ## not found - raise exception - why? why not?
   end
end  



buf = <<TXT

In a Table

| No   |  24x24  | Name | Inscription №  |
|------|---------|------|----------------|
TXT


inscribes.each_with_index do |(name,id), i|
    meta_path = "#{cache_dir}/#{id}.json"
 
    meta = read_json( meta_path )

    num = title_to_num( meta['title'])

  buf << "| #{i} | ![](i/#{name}.png) |  #{labels[i]} | "
  buf << "[№ #{num}](https://ordinals.com/inscription/#{id}) |\n" 
end


puts
puts buf
puts


ids = []
inscribes.each_with_index do |(name,id), i|
    ids << id
end

puts ids.join( "\n" )
puts


###
## assemble spritesheet
composite = ImageComposite.new( 10, 14, width: 24,
                                        height: 24 )

inscribes.each_with_index do |(name,id), i|
  path = "./tmp/genesis/#{name}.png"
  img = Image.read( path )
  composite << img
end


composite.save( "./tmp/genesis/spritesheet.png" )
# composite.zoom(4).save( "./tmp/genesis/spritesheet@4x.png" )
# composite.zoom(8).save( "./tmp/genesis/spritesheet@8x.png" )



puts "bye"
