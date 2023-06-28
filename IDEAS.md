# Ideas


## Register Collections - Inscribes BEFORE Deploy


here's an idea ... 
this is a new ordgen / ORC-721 word's 1st generative ....
... BEFORE deploy people inscribe .PNGs for the collection ... you specifiy  e.g.  24x24px canvas or anything if you want ...
... now the ordgen / ORC-721 protocol update and new feature ...
... if you leave out the max key  (and the dim key)  than you can turn any inscribes (BEFORE deploy) into a collection!
example:

```
og deploy canvas
<inscribe id no. 0>
<inscribe id no. 1>
<inscribe id no. 2>
....
```

that's it.  no need for max because the number of inscribe ids listed are the max.



.. let's explore options for a new ordgen / ORC-721 collection syntax where you inscribe the mints (as .PNGs)  BEFORE the deploy inscribe!

... so what?!

... here is the proposal ... yes, a single text deploy can turn ordinalpunks into the world's 1st ORC-721 / ordgen collection using the new formula / update ...

... all ordinal punks already inscribed as .PNGs BEFORE deploy!

... what's missing to wrap-up is the deploy to turn the "free-floating" .PNGs into a collection for indexers. here's the suggested format:

```
og deploy ordinalpunks
<inscribe id - ordinal punk no. 1>
<inscribe id - ordinal punk no. 2>
<inscribe id - ordinal punk no. 3>
...
```

that's it. no need for max because the inscribe id list IS the max ... and the magic switch to turn a deploy to use the "BEFORE" formula is dropping the max / maxblock. that's it.

as a bonus - ordgen / ORC-721 slugs / keys are like sat names  - first-come / first-serve - and, thus, the ordinalpunks name is yours forever with a deploy.

now what for you might be thinking?
what if .... a ordgen / ORC-721 indexer produces a listing something like this ... https://unisat.io/brc20  or this https://www.brc-20.io/   - do you want to ("automagically") get listed or not? being world's first counts ;-). 

...let's explore some more...  let's go recursive! ... recursive what!? ...

... let's use the inscribe id for the ordinalpunks meta data / manifest!!
now how does this look:

```
og deploy ordinalpunks
a64027dabba3c5acf83068028edf4e938464ff3c6b279f0415f5c6573cf03207i0
```

yes. that's it.
and the inscribe id is this -> https://ordinals.com/content/a64027dabba3c5acf83068028edf4e938464ff3c6b279f0415f5c6573cf03207i0 
(the official meta data manifest inscribe by @FlowStay )

thus - the new proposal - if anyone wants to inscribe this text ( two lines):

```
og deploy ordinalpunks
a64027dabba3c5acf83068028edf4e938464ff3c6b279f0415f5c6573cf03207i0
```

than this is the world's 1st ordgen / ORC-721 collection with meta data manifest using the BEFORE formula for automagic processing by indexers.


.. one more thing ...

... one option  is to turn this into a new "on-chain" protocol kind of sat names for collections   ....   any good names for the new protocol? here's the reworked further simplified version using the new proposed collection protocol: 

```
collection ordinalpunks
a64027dabba3c5acf83068028edf4e938464ff3c6b279f0415f5c6573cf03207i0
```



---


Q: `og deploy ordinalpunks` - what is this?

A: this is a suggested ordgen / ORC-721 protocol update to REGISTER  collections with .PNGs inscribed BEFORE deploy  ... that works perfectly for ordinal punks if anyone wants to try -  comments and questions welcome. 




## More Dimensions (X and Y)

> your orangenpixel [by ZimmerAllDay] idea was already realized on ETH

1-bit 20x24 canvas example on ethereum -> <https://canvas.papercorp.org>

> turn your imagination into an NFT in a 20x20 canvas

pixel format  is:

```
[
  [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
  [0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0]
  [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
  [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
  [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
  [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
  [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
  [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
  [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
  [0,0,0,0,0,1,0,0,0,0,0,0,0,1,0,0,0,0,0,0]
  [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
  [0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0]
  [0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0]
  [0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0]
  [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
  [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
  [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
  [0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
  [0,0,0,0,0,0,1,0,0,0,1,1,1,0,0,0,0,0,0,0]
  [0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0]
]
```

... that is the canvas matrix metadata (copy-n-pasted) from the website ...

... that meta data "matrix" style format looks like hitting the jack pot ... and marked for an upcoming ordgen / ORC-721 protocol update that lets you expand the g(enerative) numbers in two dimensions (x and y).

let's explore some more ...

happy to do a 16 color (or 256 color - 8bit) canvas in ordgen / ORC-721 ... BUT ... 

let's introduce a new g(enerative) matrix syntax! 

.. here's the idea ... the dim is 1x1px! 
the "recursives" can be an all-in-one spritesheet with 16x1px  with 1px per color (0,1,2,3,4)  ... or 16 inscribes 1x1px with one pixel in one color ....
now the new magic matrix generative mint syntax: 

```
[ .., ..., ...]
[ .., ..., ...]
```

... for every row ... and you can use 0,1,2,3,4 for colors  ... that is like classic paint by numbers .... e.g.

```
[0 0 0 1 0 ....]
[0 1 2 2 4 5 6 ...]
[4 4 5 ...]
```

... and so on ...  maybe change to commas for starting a new row / line / anywhere e.g.

```
0 0 0 1 0 ...  ,
0 1 2 2 4 5 6 ... ,
4 4 5 ...  ,
```

... or maybe even better only numbers no commas  ... and in deploy a new   dim: 24x24px  AND tile: 1x1px  or dim: 24x24px / 1x1px  and than only series of numbers e.g. colors 0 to 15 (16).

happy to experiment if anyone interested in a 16 color or 256 (8-bit) color canvas in 24x24px or such in ORC-721 / ordgen. 

but remember to inscribe a bitmap / pixel canvas the easiest is to inscribe .PNG ... .PNG has all the "metadata" e.g. pixels and colors encoded in binary with compression - can't beat that  - but sure with ordgen / ORC-721 in the deploy you CAN specifiy the color palette and the canvas size and the collection max. and such ... that sure is something extra (beyond plain .PNG inscribe).





## Alternate Spritesheet Formats

Why? Why not?


###  Option 1) - Tabular Text / Dataset (.csv) - Compact (Less Bytes, Saving Sats!)


Using the tabular (text) format in the comma-separated values (.csv) format
lets you add "on-chain" metadata
such as names, categories, and more.


Example - spritesheet.csv:

``` csv
name,   category, base64
Human,  Base,iVBORw0KGgoAAAANSUhEUgAAABgAAAAYBAMAAAASWSDLAAAAElBMVEUAAAAAAADWdQf3kxr4rUv///+T6IvaAAAABnRSTlMA//////96eeD+AAAAXklEQVR4nGNiQAJM5HIEBQUFYBxGJSUlRRhHiBFIC8CU8SPr+YDTtP8fGN5DOYwK/w0YPsNlmB4wyME4D5D0/AdS95BNU8Ll6n/IyphQlf37AOfcu3cfIfP//QcM0wAaAxSH2HomKQAAAABJRU5ErkJggg==
Vampire, Base,iVBORw0KGgoAAAANSUhEUgAAABgAAAAYBAMAAAASWSDLAAAAFVBMVEUAAAAAAABbMwOlXQX2AAv3kxr////bh9zEAAAAB3RSTlMA////////pX+m+wAAAG1JREFUeJxjYkACTORyBAUFBWAcRhcXF0cYRwSIWQRINO3fA4Z7UA6jwz8DhsdwGZYPDPYwzgEkPf+B1B5k01xw2bNnzwEEx8TFAMxhFBRkYBBg4PkA4vxnFAQp2w9R9h7kI4EPEM5/EP0erBUAERwWzx5CqboAAAAASUVORK5CYII=
Demon,   Base,iVBORw0KGgoAAAANSUhEUgAAABgAAAAYBAMAAAASWSDLAAAAD1BMVEUAAAAAAAC4cAv3kxr///+zzqXqAAAABXRSTlMA/////xzQJlIAAABgSURBVHichY3dDYAgDISPTgAuYGX/mdANaByAqonSEhPty+XL/ZTgjj4hRCB1Z0Fgi6VoHcq5w3Rp/J0eQQX1hsDK2G1aMD+wuY6eUvxa9uD/NB+jMdakQymrOVrltXYAZGITh03FFbsAAAAASUVORK5CYII=
Zombie,  Base,iVBORw0KGgoAAAANSUhEUgAAABgAAAAYBAMAAAASWSDLAAAAElBMVEUAAAAAAADHcwz3kxr/AAD/z5G469XyAAAABnRSTlMA//////96eeD+AAAAYUlEQVR4nJ2O0Q2AMAhEDyZoHUAr+89UjQuUCVr7IZXE9Ec+IC93HDBc8V+IMQYDEpHdYOmNg9lWv3NO05qiPECJFdtQasJlcBJgR1sf2afJ7OvqbeRthKoDcj5epRX9pN0MGRSH7kVdXgAAAABJRU5ErkJggg==
Ape,     Base,iVBORw0KGgoAAAANSUhEUgAAABgAAAAYBAMAAAASWSDLAAAAElBMVEUAAAAAAAD3kxr3nzL/xHj////N6G+OAAAABnRSTlMA//////96eeD+AAAAb0lEQVR4nJ3PwQ2AMAgAQNq+TcoGJg6gkf1HIDqCcYGyQFs1kdKHL/nQC4WAhy78XyBiVLgbqHgeLn721JSkYSJarSKQXrhYRjhbJQjMCummVThyttElhNLgLd9NzLudQLQ0DABZFI55s2+1W1TjAn1pHXVHt3hFAAAAAElFTkSuQmCC
Alien,   Base,iVBORw0KGgoAAAANSUhEUgAAABgAAAAYBAMAAAASWSDLAAAAElBMVEUAAAAAAACcXA7QeA33kxr/z5E7kZyXAAAABnRSTlMA//////96eeD+AAAAY0lEQVR4nGNiQAJM5HIEBQUFYBxGY2NjQxhHmJGBgVkApowfWc8HHKYxMvy7wHAXyhFW+K/A8AnKeSsANApu9AWYEUDOf7wOFUDinD17AcExNjZA1vP3A5Ky8wiZ/+8/YBgNAJwZFZmWaFZKAAAAAElFTkSuQmCC
...
```

Note: The name (or names) or the category columns
are optional - only the base64-encoded image is required - and, yes you
can add more columns as you please.


Aside - What's base64?

Images are binary blobs - using the base64 encoding
you can convert (or encode) the binary blob into
an ascii-7bit (& utf-8)-safe text snippet that you can copy-n-paste
into any text file.



**D.I.Y. Punks Sample**

Example - [diypunks/spritesheet.csv](sandbox/diypunks/spritesheet.csv):

``` csv
name,   category, base64
Human,  Base,iVBORw0KGgoAAAANSUhEUgAAABgAAAAYBAMAAAASWSDLAAAAElBMVEUAAAAAAADWdQf3kxr4rUv///+T6IvaAAAABnRSTlMA//////96eeD+AAAAXklEQVR4nGNiQAJM5HIEBQUFYBxGJSUlRRhHiBFIC8CU8SPr+YDTtP8fGN5DOYwK/w0YPsNlmB4wyME4D5D0/AdS95BNU8Ll6n/IyphQlf37AOfcu3cfIfP//QcM0wAaAxSH2HomKQAAAABJRU5ErkJggg==
Vampire, Base,iVBORw0KGgoAAAANSUhEUgAAABgAAAAYBAMAAAASWSDLAAAAFVBMVEUAAAAAAABbMwOlXQX2AAv3kxr////bh9zEAAAAB3RSTlMA////////pX+m+wAAAG1JREFUeJxjYkACTORyBAUFBWAcRhcXF0cYRwSIWQRINO3fA4Z7UA6jwz8DhsdwGZYPDPYwzgEkPf+B1B5k01xw2bNnzwEEx8TFAMxhFBRkYBBg4PkA4vxnFAQp2w9R9h7kI4EPEM5/EP0erBUAERwWzx5CqboAAAAASUVORK5CYII=
Demon,   Base,iVBORw0KGgoAAAANSUhEUgAAABgAAAAYBAMAAAASWSDLAAAAD1BMVEUAAAAAAAC4cAv3kxr///+zzqXqAAAABXRSTlMA/////xzQJlIAAABgSURBVHichY3dDYAgDISPTgAuYGX/mdANaByAqonSEhPty+XL/ZTgjj4hRCB1Z0Fgi6VoHcq5w3Rp/J0eQQX1hsDK2G1aMD+wuY6eUvxa9uD/NB+jMdakQymrOVrltXYAZGITh03FFbsAAAAASUVORK5CYII=
...
```


**D.I.Y. Wiener**

Example - no2/spritesheet.csv:

``` csv
name, category, base64

...
```

**D.I.Y. Ordibots**



**Format Option 2) Tabular Text (.csv) - Compact**

Example - [diyordibots/spritesheet.csv](sandbox/diyordibots/spritesheet.csv):

``` csv
name, category, base64
blue, background, iVBORw0KGgoAAAANSUhEUgAAACAAAAAgAQMAAABJtOi3AAAAA1BMVEVkhZa3PARZAAAAC0lEQVR4AWMY5AAAAKAAAVQqnscAAAAASUVORK5CYII=
bitcoin-orange, background, iVBORw0KGgoAAAANSUhEUgAAACAAAAAgAQMAAABJtOi3AAAAA1BMVEX3kh03gNzOAAAAC0lEQVR4AWMY5AAAAKAAAVQqnscAAAAASUVORK5CYII=
brown, background, iVBORw0KGgoAAAANSUhEUgAAACAAAAAgAQMAAABJtOi3AAAAA1BMVEWUVU4LyOhwAAAAC0lEQVR4AWMY5AAAAKAAAVQqnscAAAAASUVORK5CYII=
purple, background, iVBORw0KGgoAAAANSUhEUgAAACAAAAAgAQMAAABJtOi3AAAAA1BMVEWOb7aMtmqBAAAAC0lEQVR4AWMY5AAAAKAAAVQqnscAAAAASUVORK5CYII=
antenna, accessories, iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAAKUlEQVRYCe3BsQ0AIADDsOT/o8sJLEgssSHJhTpg4oDxmzKSJEmS5KEDUlIFA6L+DvwAAAAASUVORK5CYII=
none, accessories, iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAAGklEQVRYR+3BAQEAAACCIP+vbkhAAQAAAO8GECAAAcFgLJ8AAAAASUVORK5CYII=
rainbow, accessories, iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAAu0lEQVRYw+2OsQ5EQBCG12ucjhegpaFdPa/GG3BoeDMamv1vZ5bG1XvJJfMlX2ZGJPspJQiCIAiCIAiWI0tx5imOLMHvH88T4K2sAU8OYROcNojuk/fUTxzGAGYvgb2w02pDzKisLoh2kHb3EmC2EtVUQ88NT3OHbIWLonnpJUBPDcLWsK8O0BRzBem5RkXyXfsJoEeHaMEQr+yrcyFk2IJvF2f8BAzxgufdsytL923/+LeP1q9vgvB3fABOiLQ6WjY8vQAAAABJRU5ErkJggg==
...
```



###  Option 2)  -  Structured Text / Dataset (.json)  - Classic

Using the structured (text) format in the javascript object notation (.json) format
lets you add "on-chain" metadata
such as names, categories, and more.

Example - spritesheet.json:

``` json
[{ "name": "Human",
   "category": "Base",
    "base64": "iVBORw0KGgoAAAANSUhEUgAAABgAAAAYBAMAAAASWSDLAAAAElBMVEUAAAAAAADWdQf3kxr4rUv///+T6IvaAAAABnRSTlMA//////96eeD+AAAAXklEQVR4nGNiQAJM5HIEBQUFYBxGJSUlRRhHiBFIC8CU8SPr+YDTtP8fGN5DOYwK/w0YPsNlmB4wyME4D5D0/AdS95BNU8Ll6n/IyphQlf37AOfcu3cfIfP//QcM0wAaAxSH2HomKQAAAABJRU5ErkJggg==" },
  { "name": "Vampire",
    "category": "Base",
    "base64": "iVBORw0KGgoAAAANSUhEUgAAABgAAAAYBAMAAAASWSDLAAAAFVBMVEUAAAAAAABbMwOlXQX2AAv3kxr////bh9zEAAAAB3RSTlMA////////pX+m+wAAAG1JREFUeJxjYkACTORyBAUFBWAcRhcXF0cYRwSIWQRINO3fA4Z7UA6jwz8DhsdwGZYPDPYwzgEkPf+B1B5k01xw2bNnzwEEx8TFAMxhFBRkYBBg4PkA4vxnFAQp2w9R9h7kI4EPEM5/EP0erBUAERwWzx5CqboAAAAASUVORK5CYII=" },
  { "name": "Demon",
    "category": "Base",
    "base64": "iVBORw0KGgoAAAANSUhEUgAAABgAAAAYBAMAAAASWSDLAAAAD1BMVEUAAAAAAAC4cAv3kxr///+zzqXqAAAABXRSTlMA/////xzQJlIAAABgSURBVHichY3dDYAgDISPTgAuYGX/mdANaByAqonSEhPty+XL/ZTgjj4hRCB1Z0Fgi6VoHcq5w3Rp/J0eQQX1hsDK2G1aMD+wuY6eUvxa9uD/NB+jMdakQymrOVrltXYAZGITh03FFbsAAAAASUVORK5CYII=" },
  { "name": "Zombie",
    "category": "Base",
    "base64": "iVBORw0KGgoAAAANSUhEUgAAABgAAAAYBAMAAAASWSDLAAAAElBMVEUAAAAAAADHcwz3kxr/AAD/z5G469XyAAAABnRSTlMA//////96eeD+AAAAYUlEQVR4nJ2O0Q2AMAhEDyZoHUAr+89UjQuUCVr7IZXE9Ec+IC93HDBc8V+IMQYDEpHdYOmNg9lWv3NO05qiPECJFdtQasJlcBJgR1sf2afJ7OvqbeRthKoDcj5epRX9pN0MGRSH7kVdXgAAAABJRU5ErkJggg==" },
  { "name": "Ape",
    "category": "Base",
    "base64": "iVBORw0KGgoAAAANSUhEUgAAABgAAAAYBAMAAAASWSDLAAAAElBMVEUAAAAAAAD3kxr3nzL/xHj////N6G+OAAAABnRSTlMA//////96eeD+AAAAb0lEQVR4nJ3PwQ2AMAgAQNq+TcoGJg6gkf1HIDqCcYGyQFs1kdKHL/nQC4WAhy78XyBiVLgbqHgeLn721JSkYSJarSKQXrhYRjhbJQjMCummVThyttElhNLgLd9NzLudQLQ0DABZFI55s2+1W1TjAn1pHXVHt3hFAAAAAElFTkSuQmCC" },
  { "name": "Alien",
    "category": "Base",
    "base64": "iVBORw0KGgoAAAANSUhEUgAAABgAAAAYBAMAAAASWSDLAAAAElBMVEUAAAAAAACcXA7QeA33kxr/z5E7kZyXAAAABnRSTlMA//////96eeD+AAAAY0lEQVR4nGNiQAJM5HIEBQUFYBxGY2NjQxhHmJGBgVkApowfWc8HHKYxMvy7wHAXyhFW+K/A8AnKeSsANApu9AWYEUDOf7wOFUDinD17AcExNjZA1vP3A5Ky8wiZ/+8/YBgNAJwZFZmWaFZKAAAAAElFTkSuQmCC" },
 ...
]
```

Note: The name (or names) or the category keys
are optional - only the base64-encoded image is required - and, yes you
can add more keys as you please.









