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

1) binary - ultra-compact (less bytes, saving sats!)
2) tabular (.csv) - compact (less bytes, saving sats!)
3) structured (.json)  - classic


Let's use the d.i.y (ordinal) punks as an example.


### Format Optin 1) Binary - Ultra-Compact

Inscribe the spritesheet / art layers as a single binary image file (image/png).

Example:



Note:  To make it work all sprites or attributes MUST be of the same image dimension (e.g. 24x24) and get referenced by number (starting with 0)
count left-to-right and top-to-bottom.


Thus, [3,18,24,49]`, for example, from the mint example no. 1:

``` json
{
   "p":"orc-721",
   "op":"mint",
   "s":"diypunks",
   "g":[3,18,24,49]
}
```
references the sprite / attribute no. 3, 18, 24, 49
and the get merged / stacked in the order listed.











## Deploy Inscriptions


## Mint Inscriptions







## Sample Collections






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

