# Generative ORC-721 Protocol / Standard for Bitcoin & Co.

Author:  Gerald Bauer (Punk's Not Dead, Learn Pixel Art, et al)



Let's deploy a new 10 000 d.i.y. punk (pixel head) collection
in 8 seconds ;-) - yes, you can. Example:


``` json
{
    "p": "orc-721",
    "op": "deploy",
    "slug": "diypunks",
    "name": "D.I.Y. Punks",
    "max": 10000,
    "dim": "24x24",
    "generative": "<spritesheet/art layers inscription id here>"
}
```

That's it. Ready to mint the first punk:

``` json
{
   "p":"orc-721",
   "op":"mint",
   "s":"diypunks",
   "g":[3,18,24,49]
}
```

and the second:

``` json
{
   "p":"orc-721",
   "op":"mint",
   "s":"diypunks",
   "g":[1,14,42]
}
```

and so on.



Where's the catch?   Step 0: To make  it work you can (re)use
existing inscribed spritesheets / art layers or inscribe your very own.
Read on.



## Spritesheet / Artwork Layers Inscriptions

To inscribe your spritesheet(s) / art layers you have
three format options:

1) binary image - ultra-compact (less bytes, saving sats!)
2) tabular text / dataset (.csv) - compact (less bytes, saving sats!)
3) structured text / dataset (.json)  - classic


Let's use the d.i.y (ordinal) punks as an example.


### Format Option 1) Binary Image - Ultra-Compact

Inscribe the spritesheet / art layers as a single binary image file (image/png).

Example - spritesheet.png (~8kb):

![](no1/spritesheet.png)

<details>
<summary markdown="1">4x</summary>

![](no1/spritesheet@4x.png)

</details>



Note:  To make it work all sprites or attributes MUST be of the same image dimension (e.g. 24x24) and get referenced by number (starting with 0)
counting left-to-right and top-to-bottom.


Thus, for example `[3,18,24,49]` from the mint example no. 1:

``` json
{
   "p":"orc-721",
   "op":"mint",
   "s":"diypunks",
   "g":[3,18,24,49]
}
```

references the sprites / attributes no. 3, 18, 24, 49
and the sprites / attributes
get merged / stacked / pasted-on-top-of-each-other in the order listed.


Aside - Pasted On Top Of Each Other?!

Yes, the (generative) magic is the transparent background / color!
If you merge a solid / fully opaque image (let's say all black)
on-top-of another image, than it gets completly overwritten -
to make the (generative) magic work - use the transparent color
in your sprite / art layers.





### Format Option 2) Tabular (.csv) - Compact


Using the tabular (text) format in the comma-separated values (.csv) format
lets you add "on-chain" metadata
such as names, categories, and more.


Example - spritesheet.csv:

``` csv
name,           category,    base64
Blue,           Background,iVBORw0KGgoAAAANSUhEUgAAACAAAAAgAQMAAABJtOi3AAAAA1BMVEVkhZa3PARZAAAAC0lEQVR4AWMY5AAAAKAAAVQqnscAAAAASUVORK5CYII=
Bitcoin Orange, Background, iVBORw0KGgoAAAANSUhEUgAAACAAAAAgAQMAAABJtOi3AAAAA1BMVEX3kh03gNzOAAAAC0lEQVR4AWMY5AAAAKAAAVQqnscAAAAASUVORK5CYII=
Purple,         Background, iVBORw0KGgoAAAANSUhEUgAAACAAAAAgAQMAAABJtOi3AAAAA1BMVEWOb7aMtmqBAAAAC0lEQVR4AWMY5AAAAKAAAVQqnscAAAAASUVORK5CYII=
Antenna,        Accessories, iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAAKUlEQVRYCe3BsQ0AIADDsOT/o8sJLEgssSHJhTpg4oDxmzKSJEmS5KEDUlIFA6L+DvwAAAAASUVORK5CYII=
Rainbow,        Accessories, iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAAu0lEQVRYw+2OsQ5EQBCG12ucjhegpaFdPa/GG3BoeDMamv1vZ5bG1XvJJfMlX2ZGJPspJQiCIAiCIAiWI0tx5imOLMHvH88T4K2sAU8OYROcNojuk/fUTxzGAGYvgb2w02pDzKisLoh2kHb3EmC2EtVUQ88NT3OHbIWLonnpJUBPDcLWsK8O0BRzBem5RkXyXfsJoEeHaMEQr+yrcyFk2IJvF2f8BAzxgufdsytL923/+LeP1q9vgvB3fABOiLQ6WjY8vQAAAABJRU5ErkJggg==
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



### Format Option 3) Structured Text (.json) - Classic

Using the structured (text) format in the javascript object notation (.json) format
lets you add "on-chain" metadata
such as names, categories, and more.

Example - spritesheet.json:

``` json
[{ "name": "Blue",
   "category": "Background",
   "base64": "iVBORw0KGgoAAAANSUhEUgAAACAAAAAgAQMAAABJtOi3AAAAA1BMVEVkhZa3PARZAAAAC0lEQVR4AWMY5AAAAKAAAVQqnscAAAAASUVORK5CYII=" },
 { "name": "Bitcoin Orange",
   "category": "Background",
   "base64": "iVBORw0KGgoAAAANSUhEUgAAACAAAAAgAQMAAABJtOi3AAAAA1BMVEX3kh03gNzOAAAAC0lEQVR4AWMY5AAAAKAAAVQqnscAAAAASUVORK5CYII=" },
 { "name": "Purple",
   "category": "Background",
   "base64": "iVBORw0KGgoAAAANSUhEUgAAACAAAAAgAQMAAABJtOi3AAAAA1BMVEWOb7aMtmqBAAAAC0lEQVR4AWMY5AAAAKAAAVQqnscAAAAASUVORK5CYII=" },
 { "name": "Antenna",
   "category": "Accessories",
   "base64": "iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAAKUlEQVRYCe3BsQ0AIADDsOT/o8sJLEgssSHJhTpg4oDxmzKSJEmS5KEDUlIFA6L+DvwAAAAASUVORK5CYII=" },
 { "name": "Rainbow",
   "category": "Accessories",
   "base64": "iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAYAAABzenr0AAAAu0lEQVRYw+2OsQ5EQBCG12ucjhegpaFdPa/GG3BoeDMamv1vZ5bG1XvJJfMlX2ZGJPspJQiCIAiCIAiWI0tx5imOLMHvH88T4K2sAU8OYROcNojuk/fUTxzGAGYvgb2w02pDzKisLoh2kHb3EmC2EtVUQ88NT3OHbIWLonnpJUBPDcLWsK8O0BRzBem5RkXyXfsJoEeHaMEQr+yrcyFk2IJvF2f8BAzxgufdsytL923/+LeP1q9vgvB3fABOiLQ6WjY8vQAAAABJRU5ErkJggg=="},
 ...
]
```

Note: The name (or names) or the category keys
are optional - only the base64-encoded image is required - and, yes you
can add more keys as you please.







## Deploy Inscriptions


## Mint Inscriptions








## Sample Collections

### Sample No. 3 - D.I.Y. Orange-Pilled Punks (w/ Laser Eyes Optional)

**Format Option 1) Binary Image - Ultra-Compact**

Example - [no1/spritesheet.png](no1/spritesheet.png) (~??kb):

![](no1/spritesheet.png)

<details>
<summary markdown="1">4x</summary>

![](no1/spritesheet@4x.png)

</details>


**Format Option 2) Tabular Text (.csv) - Compact**

Example - [no1/spritesheet.csv](no1/spritesheet.csv):

``` csv
name, category, base64
...
```

and the deploy inscription:

``` json
{
    "p": "orc-721",
    "op": "deploy",
    "slug": "diypunks",
    "name": "D.I.Y. Punks",
    "max": 100,
    "dim": "24x24",
    "generative": "<spritesheet/art layers inscription id here>"
}
```

and the mint inscriptions...



### Sample No. 2 - D.I.Y. Wiener - Edmund "Mundl" Sackbauer et al


**Format Option 1) Binary Image - Ultra-Compact**

Example - [no2/spritesheet.png](no2/spritesheet.png) (~??kb):

![](no2/spritesheet.png)

<details>
<summary markdown="1">4x</summary>

![](no2/spritesheet@4x.png)

</details>


**Format Option 2) Tabular Text (.csv) - Compact**

Example - [no2/spritesheet.csv](no2/spritesheet.csv):

``` csv
name, category, base64
...
```

and the deploy inscription:

``` json
{
    "p": "orc-721",
    "op": "deploy",
    "slug": "diywiener",
    "name": "D.I.Y. Wiener",
    "max": 100,
    "dim": "32x32",
    "generative": "<spritesheet/art layers inscription id here>"
}
```

and the mint inscriptions...





### Sample No. 3 - D.I.Y. Ordibots

What's different compared to Generative BRC-721 (by Jerry Fanelli)?
Let's compare the Ordibots (BRC-721)
and D.I.Y. Ordibots (ORC-721) inscriptions!

**Format Option 1) Binary Image - Ultra-Compact**


Example - [no3/spritesheet.png](no3/spritesheet.png) (~3kb):

![](no3/spritesheet.png)

<details>
<summary markdown="1">4x</summary>

![](no3/spritesheet@4x.png)

</details>




**Format Option 2) Tabular Text (.csv) - Compact**

Example - [no3/spritesheet.csv](no3/spritesheet.csv):

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

and the deploy inscription:

``` json
{
    "p": "orc-721",
    "op": "deploy",
    "slug": "diyordibots",
    "name": "D.I.Y. Ordibots",
    "max": 1000,
    "dim": "32x32",
    "generative": "<spritesheet/art layers inscription id here>"
}
```

and the mint inscriptions:

ordibot no. 0 specs:
- background: ![](no3/i/2_brown.png) 2 - brown
- accessories: ![](no3/i/5_none.png) 5 - none
- body:   ![](no3/i/16_standard-oval.png) 16 - standard-oval
- belly:  ![](no3/i/23_empty.png) 23 - empty
- face: ![](no3/i/9_surprised.png)  9 - surprised


``` json
{
   "p":"orc-721",
   "op":"mint",
   "s":"diyordibots",
   "g": [2,5,16,23,9]
}
```

![](no3/i/ordibot0.png)  4x
![](no3/i/ordibot0@4x.png)



ordibot no. 1 specs:

- background: ![](no3/i/0_blue.png)  0 - blue
- accessories:  ![](no3/i/4_antenna.png)  4 - antenna
- body:  ![](no3/i/16_standard-oval.png)  16 - standard-oval
- belly:  ![](no3/i/23_empty.png)  23 - empty
- face:  ![](no3/i/8_neutral.png)  8 - neutral

``` json
{
   "p":"orc-721",
   "op":"mint",
   "s":"diyordibots",
   "g": [0,4,16,23,8]
}
```

![](no3/i/ordibot1.png)  4x
![](no3/i/ordibot1@4x.png)




and so on.

**Compare to Gen-BRC-721**

The deploy inscription ([no. 8 326 719](https://ordinals.com/content/b7205d40f3b1b1486567f0d6e53ff2812983db4c03ad7d3606812cd150c64802i0))
on May 21, 2023 by Jerry Fanelli

``` json
{
  "p": "gen-brc-721",
  "op": "deploy",
  "slug": "ordibots",
  "name": "OrdiBots",
  "supply": 1000,
  "trait_types": [
     "background",
     "accessories",
     "body",
     "belly",
     "face"
    ],
  "traits": {
       ...
    }
}
```


The 1000 mint inscriptions

``` json
{
   "p":"gen-brc-721",
   "op":"mint",
   "s":"ordibots",
   "t_ins":["b7205d40f3b1b1486567f0d6e53ff2812983db4c03ad7d3606812cd150c64802i0"],
   "h":"2b936881d34e7be726d6ad3f23edbdaf84ae5974e33c987505d4d70a144859d5",
   "id":"0",
   "a":[[0,"brown"],
        [0,"none"],
        [0,"standard-oval"],
        [0,"empty"],
        [0,"surprised"]]
}
```

``` json
{
   "p":"gen-brc-721",
   "op":"mint",
   "s":"ordibots",
   "t_ins":["b7205d40f3b1b1486567f0d6e53ff2812983db4c03ad7d3606812cd150c64802i0"],
   "h":"ad82a097c19a5d349ab99db3ad9102caf624486702d9a147f4d3003162b90222",
   "id":"1",
   "a":[[0,"blue"],
        [0,"antenna"],
        [0,"standard-oval"],
        [0,"empty"],
        [0,"neutral"]]
}
```

and so on.




##  Design

What's different compared to Generative BRC-721 (by Jerry Fanelli)?

Three main ideas:

1) Make it (even) easier
2) Use less bytes (and, thus, save on inscription fees)
3) Many more options (and less restrictions / requirements)



###  More Design Notes

- Keep all keys unique, that is, MUST start with a different letter,
  thus,
  - d is the same as dim
  - g is the same as generative
  - n is the same as name
  - m is the same as max
  - s is the same as slug
  - etc.






## History / Timeline

Birth of Ordinals

Birth of BRC-20 Tokens

May 23rd, 2023 - Birth of Generative BRC-721

May 27th, 2023 - Hearing first and reading-up on the Generative BRC-721 docu / write-up by Jerry Fanelli and the 1000 Ordibots collection


May 28th, 2023 - Birthday!



## License

The Generative ORC-721 protcol, sample scripts & collections are dedicated to the public domain.
Use it as you please with no restrictions whatsoever.


# Questions? Comments?

Post them over at the [Help & Support](https://github.com/geraldb/help) page. Thanks.

