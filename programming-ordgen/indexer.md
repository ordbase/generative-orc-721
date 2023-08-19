

[« Programming (Bitcoin) Ordinal Generatives (Ordgen) / ORC-721 - Step-by-Step Book / Guide](./)



# Build Your Own Bitcoin Layer 1 (L1) Ordinal Inscription Indexer


Let's index the D.I.Y. Phunks collection, that is, ordinal (text) inscriptions
on bitcoin (BTC) also known as the layer 1 (L1) blockchain.



## Step 1:  Full-Text Search For (Candidate) Inscriptions 

Let's use the UniSat.io full-text search to find all (candidate) 
inscriptions with "diyphunks".
Try a [search for diyphunks](https://unisat.io/search?q=diyphunks&type=text&p=1). 

To automate let's use the UniSat (lite) helpers packaged up in the [unisat gem](https://github.com/ordbase/ordbase/tree/master/unisat).


```ruby
require 'unisat'

## Step 0:  Configure  the file path to your local google chrome browser 
##             required by puppeeter.
Unisat::Puppeteer.chrome_path = "your/path/to/chrome/here"

## Step 1:  
recs = Unisat::Puppeteer.search( 'diyphunks' )  
puts "  #{recs.size} inscribe(s)"
#=> 21 inscribe(s)

pp recs
#=>[{"id"=>"09e3c57879b0a30239b088468277d009f838111d254eb22f35a9b2a31b77a5d4i0",
#    "num"=>"13418851",
#    "date"=>"24.6.2023, 22:41:33",
#    "address"=>"bc1pmgu...quyqrah",
#    "text"=> "og deploy diyphunks↵name: D.I.Y. Phunks↵max: 100↵dim: ..."},
#   {"id"=>"54a448aad17203e322b3d421d91c12e1e4c1b1ca46ef2849e52774aeb7a3bd3bi0",
#    "num"=>"13418907",
#    "date"=>"24.6.2023, 22:45:20",
#    "address"=>"bc1pmgu...quyqrah",
#    "text"=>"og mint diyphunks 5 57 38"},
#    ...]
```


Note:  For now all results get "automagically" cached in `unisat/` indexed 
by query (key) and pages.   Example:

```
/unisat
  /diyphunks
     1.json
```




## Step 2:  Fetch Inscription Metadata & Content (Blobs) And Save To (SQL) Database 

Let's use the ordinals.com indexer to
fetch all metadata & content (blobs) for inscription and 
save into (SQL) database.

Try [inscription no. 13418851](https://ordinals.com/inscription/09e3c57879b0a30239b088468277d009f838111d254eb22f35a9b2a31b77a5d4i0). 

To automate let's use the ordinals.com (lite) helpers packaged up in the [ordinals gem](https://github.com/ordbase/ordbase/tree/master/ordinals).

To setup (or auto-migrate) the SQL database with tables inscribes, blobs, and more let's use
the ActiveRecord database machinery, models, scripts and more packaged 
up for easy (re)use in 
the [ordlite gem](https://github.com/ordbase/ordbase/tree/master/ordlite). 



```ruby
require 'ordlite'
require 'unisat'

## read records from cache
cache = Unisat::Cache.new( './unisat' )
recs  = cache.read( 'diyphunks' )
puts "   #{recs.size} record(s)" 
#=> 21 record(s)

OrdDb.open( './ordbase.db' )
OrdDb.import( recs )
```

resulting in:

```
Connecting to db using settings:
{:adapter=>"sqlite3", :database=>"./ordbase.db"}
-- create_table(:logs)
   -> 0.0132s
-- create_table(:props)
   -> 0.0087s
-- create_table(:inscribes, {:id=>:string})
   -> 0.0188s
-- create_table(:blobs, {:id=>:string})
   -> 0.0094s
-- create_table(:collections)
   -> 0.0091s
-- create_table(:items)
   -> 0.0079s
-- create_table(:factories, {:id=>:string})
   -> 0.0096s

[...]

GET https://ordinals.com/inscription/09e3c57879b0a30239b088468277d009f838111d254eb22f35a9b2a31b77a5d4i0...
{"title"=>"Inscription 13418851",
 "id"=>"09e3c57879b0a30239b088468277d009f838111d254eb22f35a9b2a31b77a5d4i0",
 "address"=>"bc1pmgu8jn8h0xeay6cuj74m3a76h0pvtrmge5v9sj5ngj34t7e0dlzquyqrah",
 "output-value"=>"546",
 "sat"=>"1624292286371185",
 "content-length"=>"126 bytes",
 "content-type"=>"text/plain;charset=utf-8",
 "timestamp"=>"2023-06-24 20:41:33 UTC",
 "genesis-height"=>"795765",
 "genesis-fee"=>"2233",
 "genesis-transaction"=>"09e3c57879b0a30239b088468277d009f838111d254eb22f35a9b2a31b77a5d4",
 "location"=>"09e3c57879b0a30239b088468277d009f838111d254eb22f35a9b2a31b77a5d4:0:0",
 "output"=>"09e3c57879b0a30239b088468277d009f838111d254eb22f35a9b2a31b77a5d4:0",
 "offset"=>"0"}
request no. 2@https://ordinals.com; sleeping 1 sec(s)...
GET https://ordinals.com/content/09e3c57879b0a30239b088468277d009f838111d254eb22f35a9b2a31b77a5d4i0...
  content-type: text/plain
  content-length:
request no. 3@https://ordinals.com; sleeping 1 sec(s)...
GET https://ordinals.com/inscription/54a448aad17203e322b3d421d91c12e1e4c1b1ca46ef2849e52774aeb7a3bd3bi0...
{"title"=>"Inscription 13418907",
 "id"=>"54a448aad17203e322b3d421d91c12e1e4c1b1ca46ef2849e52774aeb7a3bd3bi0",
 "address"=>"bc1pmgu8jn8h0xeay6cuj74m3a76h0pvtrmge5v9sj5ngj34t7e0dlzquyqrah",
 "output-value"=>"546",
 "sat"=>"1114073277154409",
 "content-length"=>"25 bytes",
 "content-type"=>"text/plain;charset=utf-8",
 "timestamp"=>"2023-06-24 20:45:20 UTC",
 "genesis-height"=>"795766",
 "genesis-fee"=>"2301",
 "genesis-transaction"=>"54a448aad17203e322b3d421d91c12e1e4c1b1ca46ef2849e52774aeb7a3bd3b",
 "location"=>"54a448aad17203e322b3d421d91c12e1e4c1b1ca46ef2849e52774aeb7a3bd3b:0:0",
 "output"=>"54a448aad17203e322b3d421d91c12e1e4c1b1ca46ef2849e52774aeb7a3bd3b:0",
 "offset"=>"0"}
request no. 4@https://ordinals.com; sleeping 1 sec(s)...
GET https://ordinals.com/content/54a448aad17203e322b3d421d91c12e1e4c1b1ca46ef2849e52774aeb7a3bd3bi0...
  content-type: text/plain
  content-length: 25

[...]
```


## Step 3:  Query (SQL) Database For Fun (& Profit)

Let's query for (text) inscriptions. Let's count deploy and mint candidates:

``` ruby
require 'ordlite'

OrdDb.open( './ordbase.db' )

puts
puts "  #{Inscribe.count} inscribe(s)"
puts "  #{Blob.count} blob(s)"
#=> 21 inscribe(s)
#=> 21 blob(s)


inscribes = Inscribe.search( 'deploy' )
puts "  #{inscribes.size} deploy inscribe candidate(s)"
#=> 1 deploy inscribe candidate(s)

inscribes = Inscribe.search( 'mint' )
puts "  #{inscribes.size} mint inscribe candidate(s)"
#=> 20 mint inscribe candidate(s)
```

Let's parse (& validate) the (ordgen a.k.a. og) 
deploy & mint text inscriptions:

``` ruby
require_relative 'og'

inscribes = Inscribe.search( 'deploy' )
puts "  #{inscribes.size} deploy inscribe candidate(s)"
#=> 1 deploy inscribe candidate(s)

inscribes.each do |inscribe|
  data = OG.parse_deploy( inscribe.text )
  pp data
end

inscribes = Inscribe.search( 'mint'  )
puts "  #{inscribes.size} mint inscribe candidate(s)"
#=> 20 mint inscribe candidate(s)

inscribes.each do |inscribe|
  data = OG.parse_mint( inscribe.text )
  pp data
end
```

resulting in:

```
 1 inscribe deploy candidate(s)
{"p"=>"orc-721",
 "op"=>"deploy",
 "slug"=>"diyphunks",
 "name"=>"D.I.Y. Phunks",
 "max"=>100,
 "dim"=>"24x24",
 "generative"=>["dd91c8b33dd19ccd8410e54c2099bfd50d4f777a186ee974fe4c15420c42ea0fi0"]}

20 inscribe mint candidate(s)
{"p"=>"orc-721", "op"=>"mint", "s"=>"diyphunks", "g"=>[5, 57, 38]}
{"p"=>"orc-721", "op"=>"mint", "s"=>"diyphunks", "g"=>[4, 57, 38]}
{"p"=>"orc-721", "op"=>"mint", "s"=>"diyphunks", "g"=>[6, 27]}
{"p"=>"orc-721", "op"=>"mint", "s"=>"diyphunks", "g"=>[3, 35, 52]}
{"p"=>"orc-721", "op"=>"mint", "s"=>"diyphunks", "g"=>[0, 11, 37]}
{"p"=>"orc-721", "op"=>"mint", "s"=>"diyphunks", "g"=>[58, 57, 39, 38]}
{"p"=>"orc-721", "op"=>"mint", "s"=>"diyphunks", "g"=>[4, 38, 49, 19]}
{"p"=>"orc-721", "op"=>"mint", "s"=>"diyphunks", "g"=>[57, 39, 38]}
{"p"=>"orc-721", "op"=>"mint", "s"=>"diyphunks", "g"=>[59, 0]}
{"p"=>"orc-721", "op"=>"mint", "s"=>"diyphunks", "g"=>[0, 19, 32]}
{"p"=>"orc-721", "op"=>"mint", "s"=>"diyphunks", "g"=>[0, 34, 55, 56, 15]}
{"p"=>"orc-721", "op"=>"mint", "s"=>"diyphunks", "g"=>[0, 39, 52, 16]}
{"p"=>"orc-721", "op"=>"mint", "s"=>"diyphunks", "g"=>[0, 54, 55, 23]}
{"p"=>"orc-721", "op"=>"mint", "s"=>"diyphunks", "g"=>[4, 17, 50]}
{"p"=>"orc-721", "op"=>"mint", "s"=>"diyphunks", "g"=>[4, 15]}
{"p"=>"orc-721", "op"=>"mint", "s"=>"diyphunks", "g"=>[4, 52, 19]}
{"p"=>"orc-721", "op"=>"mint", "s"=>"diyphunks", "g"=>[0, 49, 28]}
{"p"=>"orc-721", "op"=>"mint", "s"=>"diyphunks", "g"=>[58, 4, 27, 37, 38, 55]}
{"p"=>"orc-721", "op"=>"mint", "s"=>"diyphunks", "g"=>[59, 3, 57, 51, 55]}
{"p"=>"orc-721", "op"=>"mint", "s"=>"diyphunks", "g"=>[59, 8, 21, 54, 56, 52]}
```


To be continued...





## Questions? Comments?

Join us in the [Ordgen / ORC-721 discord (chat server)](https://discord.gg/dDhvHKjm2t). Yes you can.
Your questions and commentary welcome.


Or post them over at the [Help & Support](https://github.com/geraldb/help) page. Thanks.

