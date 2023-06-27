
# More ORC-721 Notes (Work-In-Progress)


Q: wen use standard text format or "classic" json format?

about the new text format - the rule is the deploy leads, that is, if the deploy is in json than the mints must be in json too and if the deploy is in text than the mints must be in text too.    json not ded (if anyone wants to deploy using "classic" json).


Q: mix-n-match of "recursion"(s) and "spritesheet"(s) possible?

yes, you can stack spritesheets too ... numbers get added.   yes, you can reference specific tiles from multiple spritesheets.  ORC-721 started with single spritesheet to keep it simple (to get started and not confuse everybody). and yes - you can mix'n'match "recursion"(s) and spritesheet(s). another world's 1st generative? wen deploy?







Q: If there is no way to know the current number
of mints and obtain the initial 721, it will be frustrating

A: sorry - i am working on a more automatic way to collect inscriptions and finalize the validation rules / protocol -   for now the best / fastest is search on https://unisat.io/ or such to get a close figure. the number is excat (but cannot do the validation - because the protocol / validation rules are  getting  finalized right now).



Q: if mints has been 721,then others would be ignored right?

A: the "overflow" mint will not be part of the official 721 collection - but they are still ordinals you can buy / sell individually - the current plan is to call / collect them under the name "cursed" overflow "negatives" and they start counting -1, -2, -3,... to infinitiy (no limit).






## search for orc-721 mints

try:

- <https://unisat.io/>  - Search in Text Inscriptions


## validate your json (orc-721 text inscription)

try:

- <https://jsonlint.com> - JSON Validator





 ## protocol trivia / research / rules  - (work-in-progress)


one deploy rule

IMPORTANT ORC-721 protocol triva -    if you (re)use copy-n-paste a deploy mint it will NOT work - sorry
the slug in the deploy mint is like a domain name and can only used once (first-come, first-serve) .... if you want to deploy v2, v3, etc. ... you MUST use a different slug e.g.  add -v2, -v3, etc.

just to clarify - the one deploy rule - a ORC-721 slug is like a domain-name "first-come / first-serve"  is valid for all ORC-721 collections -
if you do another "diypunks" you CANNOT - you must change to a new unique name (not already taken) e.g "diypunks-v2" or whatever same for "diyordibots" and "diyordibots-v2" and "diyordibots-v3" and so on.

note - duplicate mint deploy (same slug) WILL get rejected by the validation / protocol.

good news - all mints will get added to the first deploy as "cursed" overflow negatives.





Q: but the deployed  diyextraordpunks it is ok we can mint ?

A: is this a new deploy inscription with the slug "diyextraordpunks"  and NOT the first?   Than again sorry it will not work ... you MUST use a new slug  e.g. add change to  "diyextraordpunks-v2" or  "diyextraordpunks-v3" or whatever.






what's a broken mint?

the validation rules will be the same for all ORC-721 collections - it's a step-by-step algorithm  anyone can run








> oh and also one more thing i found a fault in the diyordibots the deploy inscription is before the spritesheet was ever uploaded or confirmed on the mempool so that makes the diyordibots invalid in terms of code as the deploy inscription cannot read the inscription id as it was not confirmed there ye

 o o o

> I think both diyordibots v1&v2 are valid
> Since the spritesheet inscription id is inside the deployment inscription

the ORC-721 protocol rule is a deploy inscribe is valid if the inscription id references a  spritsheet that exists.

edge case - deploy inscribe before spritesheet?  happened in diyordibots?







## pixle art image (resize) tips


btw if you want to test;

https://redketchup.io/image-resizer

- aspect ratio as original
- resampling to nearist neighbour



