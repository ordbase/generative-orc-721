# Ideas




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









