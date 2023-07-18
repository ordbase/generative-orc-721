# Mint Text Format Commentary & Ideas

short-hand mint text formats - why? why not?

```
og mint punk 58 4 19
=>
og punk 58 4 19
punk 58 4 19
punk #58 4 19
```

or use slash(`/`) 

```
punk/58 4 19
```

or allow space - why? why not?

```
punk / 58 4 19
punk/ 58 4 19
```

or lisp? style - why? why not?
```
(punk 58 4 19)
```



keep `#` for (pre-)registered generatives - why? why not?

```
punk #0
punk #1
punk #2
```

or make a collection all d.i.y. or (pre-)registered? - why? why not?

that makes `og` or/and `mint` optional
plus the new `#` is optional too. use `#`only for (pre)registered og/ordgen collections? 



## more discussions

instead of:

    og mint diypunks 58 4 19

it is

    58 4 19.diypunk

yeah maybe onto something ...  
maybe `og mint diypunks 58 4 19` still too complex ;-). 

`58 4 19.diypunk`  or `58 4 19 diypunk` or `58 4 19 diypunks`... why not?

or for diymonke that would be ...

`0.diymonke`   or `0.diymonkeys`   ...  let's think about it.

or let's drop the diy  (the number tells that it's d.i.y.) ...

`0.monke`  or  `54 58.monke`   or `54 58 1 24 28.monke`  
... searching for .monke  gets you this results for now =>  <https://unisat.io/search?q=.monke&type=text&p=1>

... lets try .punk that gets you this results for now => <https://unisat.io/search?q=.punk&type=text&p=1>

... lets  try .rock that get you this results for now => <https://unisat.io/search?q=.rock&type=text&p=1> 

... too many to ignore ...  lessons learned.  

1. drop d.i.y. and 
2. use singular in mint  eg.  punk NOT punks  or rock NOT rocks. 

how about  turning the syntax around e.g.

     0.monke    =>  monke 0    or
     54 58.monke    => monke 54 58   or 
     54 58 1 24 28.monke   => monke   54 58 1 24 28

or to add back the protocol?

     monke og 0     or og monke 0
     monke og 54 58     or og monke 54 58
     monke og 54 58 1 24 28   or  og monke   54 58 1 24 28 

f.i.y. genesis punks waiting to happen ;-).   now how about ...

     genesis 1      or 1.genesis      
     
for the mint text inscribe?

or since the dot is really sat names  
lets pick a new character for og / ordgen. 

     0.monke    =>  0/monke or
     54 58.monke    => 54 58/monke   or 
     54 58 1 24 28.monke   => 54 58 1 24 28/monke 

or maybe star \*?

     0*monke or
     54 58*monke   or 
     54 58 1 24 28*monke 

or maybe  hash rocket =>?

     0  => monke or
     54 58 => monke   or 
     54 58 1 24 28 => monke


questions? comments? what do you want your ordgen / ORC-721 mint text to look like?  
numbers before name? or name before numbers? with or without dot (.) or slash (/) or __?


maybe dollar ($) is the way to go? 

     $monke 0 or   0 $monke
     $monke 54 58   or    54 58 $monke
     $monke 54 58 1 24 28  or   54 58 1 24 28 $monke      ... why? why not? 


always obvious once you see it .. is the number sign / hashtag (#) the way to go? 

     monke #0 or
     monke #54 58   or
     monke #54 58 1 24 28     ... why? why not?

try a search on "punk #" or "monke #"  here -> https://unisat.io/search?q=punk%20%23&type=text&p=1    that gets you zero results - bingo!  it is now a og / ordgen standard.


monke #0  or rock #0 or punk #0  or __    anyone?  let's make it happen. yes, you can. 






## pre-registered collections

instead of `max:`` list generative numbers one-by-one 
or  better reference via inscriptions  - why? why not?

allow inscriptions in the format text


### attach generative or generative collection to sat names - why? why not?

list of inscribe ids - what format available now or design new one?

simple list format:
- inscibe id, optional name(s), optional category


```
og reg (or deploy?) punk
<inscribe_ids>

0, g(enerative) numbers
1, g(enerative) numbers
hello,   g(enerative) numbers
```

- allow (or use) optional comma (,) - why? why not?

than use for mint - why? why not?

```
0.punk
1.punk
hello.punk

or

punk #0
punk #1
punk hello  ???? - # not working for names really!?
```
