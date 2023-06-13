# D.I.Y. (Recursive) Apes (max. 100)

## Wen Deploy?


here's everything to make it happen
(no worries - don't wait for me - please go ahead - LFG!) and please post the link to the deploy inscription in the #generative-orc-721 channel.

here's the magic ORC-721 deploy text to inscribe (the max limit set to 100 plus the 26 recursive inscription ids (0-25) for the image generation) ...

``` json
{
    "p": "orc-721",
    "op": "deploy",
    "slug": "diyapes",
    "name": "D.I.Y. Apes",
    "max": 100,
    "dim": "24x24",
    "generative":
["b36750a6b444e3815f0cbb50a36e0f1231b74ba930855b1e9067f907942f34fci0",
 "5ce9f89ad571e5380baa5b5ee387f08ea313421e7e54662b3899d411c39321ddi0",
 "1355524a2aab576e069bac91227b0e52d227d65d84c5535377d3a0ea4e44d470i0",
 "a6b4b81f69e8c217db24f0a71954195d67ced49a819b67a4daf9f3ca7fa1b971i0",
 "83827ec13cb55a35fe3adca5acf67caf943c3bd6810f8fa893b067e8015c8f19i0",
 "5b1e638c050318bec23f17b8b7758ccf13945e422516da6c722c67ae5ed4e26di0",
 "5dcf96b13e5762d5a288d8bee36deb933fe192a55475199fe9a39ae29dd16853i0",
 "5760ce05009e94a750a7245cac994fa9ffd388eadc757929ac17737811455429i0",
 "0bd902941392ea138adb7db30cecdf5bc09a92c80e3e1bc3ecdf3c2d0abf6631i0",
 "7c2fd41b52624ddb1ba11fe1c6d95475f2e42c4b53d6aaf6a16a09064acebe38i0",
 "0f473c9dcd14e3f43a6599b038d810eac16bc6394edcfcf6b32f8df992ab6791i0",
 "d32c50c23693a028e2381d6f756746a9ff684f2028edf694ab7b1b6cde78e2cdi0",
 "d61fc2a89ecc6ae65cf91cdfac9edc37fd60c38621dac211f3a70891ef79b69ai0",
 "680e2ee8cad86aa174b4f3373d733370c9a6fc4230b9708d520a0f6bcb8e72a6i0",
 "56d3f4f661b2b4a9fc17755171d7cf4da74e570614b6b45de0cc87a809c3eb3ci0",
 "fe4321178bd841e52fdeb72ce4456c5b7596c0d611b19da15ba75ec63b5314cai0",
 "eddc1242f0fd290e130332e046897ad41dce1e7e112df48ecf2168e43172d383i0",
 "a2110fb4afaa29bc70bcfac445f750ecb5e81777e8d080be2d2b07eb030ba0ffi0",
 "c1277df4b986067b2a3f006d717b7f6d042896840c8b592e5a8b9ff22444b08fi0",
 "722dfdc90a67ff7eb892d13393a8a5b360b8a109f3d809600919684a600ff60ei0",
 "06136a5b4fb585069ef6265a0fde3baf67ee914b9f784d2c951f3a8187800d54i0",
 "8043604c7c96a5a43a97e251b246102ca40c0203431ff21bd26f23330dfa554ci0",
 "92e7f48454546718f98103d7464d954033adbee21855f06584be06faa3e291ddi0",
 "a01012b213ed425c5d4038bc36016f19f4f342ca052ff9bf6971672164e1a402i0",
 "87d89d290ebde5d5b7aa75b4c8d0359515e25ea1542bc0646dc3f5b0b2fc55fdi0",
 "aab67a4269ca0bda649fe341bd88c862aba2e9bf6e0826b9dfa5c4ba8fe62c2di0"]
}
```


NOTE:  as always please double check
that your copy-n-paste text in json format is valid e.g. ->  https://jsonlint.com/

For the D.I.Y. Apes (max. 100)  image previewer - see https://ordbase.github.io/generative-orc-721/diyapes   and for a cheatsheet /  list of attributes (0-25) with categories / structure - see https://github.com/ordbase/generative-orc-721/blob/master/diyapes/meta.csv


PS: For the mint text use - and fill-in the g numbers:

``` json
{
   "p":"orc-721",
   "op":"mint",
   "s":"diyapes",
   "g":[]
}
```


Example 1 - Ape

``` json
{
   "p":"orc-721",
   "op":"mint",
   "s":"diyape",
   "g":[0]
}
```

![](i/ape-0.png) <br>
4x <br>
![](i/ape-0@4x.png)


Example 2 - Ape / Beanie / 3D Glasses

``` json
{
   "p":"orc-721",
   "op":"mint",
   "s":"diyape",
   "g":[0,10,14]
}
```

![](i/ape-0_10_14.png) <br>
4x <br>
![](i/ape-0_10_14@4x.png)


Example 2 - Ape / Mohawk / Earring

``` json
{
   "p":"orc-721",
   "op":"mint",
   "s":"diyape",
   "g":[0,1,20]
}
```

![](i/ape-0_1_20.png) <br>
4x <br>
![](i/ape-0_1_20@4x.png)




Here be dragons. Happy minting D.I.Y. Apes (max. 100).  Wen deploy?





## Questions? Comments?

Please post in the #generative-orc-721 channel
in the ordinal punks discord.
For an invite
see <https://twitter.com/OrdinalPunks/status/1620230583711576068>.



