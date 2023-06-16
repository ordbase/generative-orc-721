# Format Notes

Classic vs Standard Text

## Mint

Classic in json  - single-line mint example:

```json
{"p":"orc-721","op":"mint","s":"diypunks","g":[59,0,38]}
```

Classic in json  - multi-line mint example:

```json
{
  "p":"orc-721",
  "op":"mint",
  "s":"diypunks",
  "g":[59,0,38]
}
```

vs

standard text mint example:

```
og mint diypunks 59 0 38
````

note:
- no quotes ("""")
- no keys  (p, op, s, g)
- no objects ({})
- no arrays ([])
- no commas (,,,,,)
- no dots (....)


## Deploy

Classic in json  - multi-line deploy example:

```json
{
    "p": "orc-721",
    "op": "deploy",
    "slug": "diypunks",
    "name": "D.I.Y. Punks",
    "max": 721,
    "dim": "24x24",
    "generative": "cf5df319bbe23fa3d012e5ee0810700c8e82aebff41164246f0d87d7b60a9903i0"
}
```

vs

standard text deploy example:

```
og deploy diypunks  
max:  721
dim:  24x24
name:  D.I.Y. Punks
cf5df319bbe23fa3d012e5ee0810700c8e82aebff41164246f0d87d7b60a9903i0
```

- start with required triplet  - protocol / operation / slug
- followed by headers  (using single-line key value pairs)
- list of inscribe ids  (generatives)



## Questions? Comments?

Please post in the #generative-orc-721 channel
in the ordinal punks discord.
For an invite
see <https://twitter.com/OrdinalPunks/status/1620230583711576068>.


