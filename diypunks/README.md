#  D.I.Y. Punks -   Work-In-Progress (WIP)

_The World's 1st (Generative) ORC-721 Collection (on Bitcoin)_



For now the official support channel is the ordinal punks discord
(join us in the #generative-orc-721 channel). For an invite
see <https://twitter.com/OrdinalPunks/status/1620230583711576068>.

For more technical questions & commentary,
please open a new issue / thread here - <https://github.com/ordbase/generative-orc-721/issues>.

For questions directed to the ORC-721 protocol author (Gerald Bauer) personally,
please open a new issue / thread here - <https://github.com/geraldb/help/issues>.



## D.I.Y. Punk Images

### 1) Indexed by inscription id

All mints (valid, broken - if auto-fix possible, "cursed" overflow "negatives")
will get generated in 1x (24x24px) and 4x (96x24px) and uploaded for public use / reference.


The naming format is `/content/<inscription_id>.png` for 1x
and `/content/<inscription_id>@4x.png` for 4x.


Example - [Inscription №9959200](https://ordinals.com/inscription/31bd26c29a483fbcde4c44d0a7f21741d72931e107aae978f43d1f6511b7bba8i0) -  The World's 1st (Generative) ORC-721 ever! - Genesis:



The id is `31bd26c29a483fbcde4c44d0a7f21741d72931e107aae978f43d1f6511b7bba8i0`
with the content:

``` json
{"p":"orc-721","op":"mint","s":"diypunks","g":[58,4,19]}
```

resulting in:

![](https://github.com/ordbase/generative-orc-721/raw/master/content/31bd26c29a483fbcde4c44d0a7f21741d72931e107aae978f43d1f6511b7bba8i0.png) <br>
(Source:
<https://github.com/ordbase/generative-orc-721/raw/master/content/31bd26c29a483fbcde4c44d0a7f21741d72931e107aae978f43d1f6511b7bba8i0.png>)

4x ![](https://github.com/ordbase/generative-orc-721/raw/master/content/31bd26c29a483fbcde4c44d0a7f21741d72931e107aae978f43d1f6511b7bba8i0@4x.png) <br>
(Source: <https://github.com/ordbase/generative-orc-721/raw/master/content/31bd26c29a483fbcde4c44d0a7f21741d72931e107aae978f43d1f6511b7bba8i0@4x.png>



For more see  [/content »](../content)



### 2) Indexed by g(enerative) specs / ids

All mints (valid, broken - if auto-fix possible, "cursed" overflow "negatives")
will get generated in 1x (24x24px) and 4x (96x24px) and uploaded for public use / reference.


The naming format is `/<slug>/g/<generative_ids>.png` for 1x
and `/<slug>/g/<generative_ids>.png@4x.png` for 4x.


Example - [Inscription №9959200](https://ordinals.com/inscription/31bd26c29a483fbcde4c44d0a7f21741d72931e107aae978f43d1f6511b7bba8i0) -  The World's 1st (Generative) ORC-721 ever! - Genesis:

``` json
{"p":"orc-721","op":"mint","s":"diypunks","g":[58,4,19]}
```

![](https://github.com/ordbase/generative-orc-721/raw/master/diypunks/g/58_4_19.png) <br>
(Source:
<https://github.com/ordbase/generative-orc-721/raw/master/diypunks/g/58_4_19.png>)

4x ![](https://github.com/ordbase/generative-orc-721/raw/master/diypunks/g/58_4_19@4x.png) <br>
(Source:
<https://github.com/ordbase/generative-orc-721/raw/master/diypunks/g/58_4_19@4x.png>)


For more see  [/diypunks/g »](g)





### More

SOON!  The reference (open-source) javascript file to render the generative image
online via data fetched from "on-chain" ordinals content only.



## Frequently Asked Questions (F.A.Qs) and Answers

### Q: What's a broken mint inscription?

Your mint inscription MUST be valid json - try any json validation service online or offline.
Example: <https://jsonlint.com>



Example (broken) real-world mints:

- smart (opening & closing) quotes


``` json
```


- "numbers delimited by dot NOT commas


``` json
```

Note: These (broken) inscriptions are still ordinals that you own and, thus, can sell or buy -
are early misprints (or mismints) the new ultra-rares?



### Q:  What can I do if I minted broken inscriptions?

Work-In-Progress

The plan for now is - you are welcome to inscribe again (with a valid json) -
note: your mint inscription will get added on the first-come, first-serve principle
and, thus, if the max limit (721) is hit will get added to the "cursed" overflow "negatives".

The more controversial still under discussion second option (in addition to working first above)
is to start a second "diypunks-v2" collection - with a new ORC-721 deploy inscription e.g.

```json
{
  "p":"orc-721",
  "op":"deploy",
  "slug":"diypunks-v2",
  "name":"D.I.Y. Punks V2",
  "max":721,
  "dim":"24x24",
  "generative":"cf5df319bbe23fa3d012e5ee0810700c8e82aebff41164246f0d87d7b60a9903i0"
}
```

that gives you (and everyone else) a second chance to get in a mint below 721.   If you support this idea
and are interested in doing the "deploy" inscription - please, tell us / say so on the ordinals punk channel!





### Q: Can I mint more than one generative in an inscription?

Sorry - there's a 1:1 (one-to-one) mapping from (generative) text inscription to
(generative) image.  Thus, if you add more than one mint in the inscription
your mint will be broken (even if valid json).

Example broken real-world mints:

``` json
```

Note: These (broken) inscriptions are still ordinals that you own and, thus, can sell or buy -
are early misprints (or mismints) the new ultra-rares?



