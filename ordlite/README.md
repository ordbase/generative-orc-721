# Ordinal Inscription (SQL) Database 


ordlite - ordinals inscription (on bitcoin & co) database let's you query via sql and more


* home  :: [github.com/ordbase/generative-orc-721](https://github.com/ordbase/generative-orc-721)
* bugs  :: [github.com/ordbase/generative-orc-721/issues](https://github.com/ordbase/generative-orc-721/issues)
* gem   :: [rubygems.org/gems/ordlite](https://rubygems.org/gems/ordlite)
* rdoc  :: [rubydoc.info/gems/ordlite](http://rubydoc.info/gems/ordlite)



##  SQL Database Model

Insribes •  Blobs


Table Inscribes

``` sql
CREATE TABLE "inscribes" (
    "id" varchar NOT NULL PRIMARY KEY, 
    "num" integer NOT NULL,
    "bytes" integer NOT NULL,
    "content_type" varchar NOT NULL,
    "date" datetime(6) NOT NULL,
    "sat" integer NOT NULL,
    "block" integer NOT NULL,
    "fee" integer NOT NULL,
    "tx" varchar NOT NULL,
    "offset" integer NOT NULL,
    "address" varchar NOT NULL,
    "output" varchar NOT NULL,
    "value" integer NOT NULL,
)
```

Table Blobs

``` sql
CREATE TABLE "blobs" (
    "id" varchar NOT NULL PRIMARY KEY, 
    "content" blob NOT NULL, 
)
```


##  Usage


### Step 0:  Setup Databae

``` ruby
require 'ordlite'

OrdDb.connect( adapter:  'sqlite3',
               database: './ord.db' )

OrdDb.create_all     # build table schema

puts
puts "  #{Inscribe.count} inscribe(s)"
puts "  #{Blob.count} blob(s)"

#=>  0 inscribe(s)
#=>  0 blob(s)
```




### Example No 1 - Query Ordgen Deploy / Mint Inscriptions

``` ruby
require 'ordlite'


OrdDb.connect( adapter:  'sqlite3',
               database: './ord.db' )


####################
## query for deploy candidates
##
##  e.g. sql where clause like
##     content LIKE '%deploy%' 
##       AND (   content LIKE '%orc-721%' 
##            OR content LIKE '%og%')
## 

deploys = Inscribe.deploys
puts "   #{deploys.size} deploy candidate(s)"

deploys.each_with_index do |rec,i|
    puts "==> deploy #{i} - num #{rec.num} - #{rec.bytes} bytes - #{rec.date}"
    puts rec.content 
end


punks_deploys = Inscribe.deploys_by( slug: 'diypunks')
puts "   #{punks_deploys.size} deploy candidate(s)"



#######################
## query for mint candidates
##
##  e.g. sql where clause like
##     content LIKE '%mint%' 
##       AND (   content LIKE '%orc-721%' 
##            OR content LIKE '%og%')

mints = Inscribe.mints
puts "   #{mints.size} mint candidate(s)"

## print last hundred mint candidates
mints[-100,100].each_with_index do |rec,i|
    puts "==> mint #{i} - num #{rec.num} - #{rec.bytes} bytes - #{rec.date}"
    puts rec.content 
end


phunks_mints = Inscribe.mints_by( slug: 'diyphunks')
puts "   #{phunks_mints.size} mint candidate(s)"


puts "   #{deploys.size} deploy candidate(s)"
puts "   #{mints.size} mint candidate(s)"

#=> 123 deploy candidate(s)
#=> 7453 mint candidate(s)
```




### Bonus:  Import (Cached) Inscription Datafiles (& Content)

Let's import all cached 
inscriptions metadata datafiles (& content)
from  [/ordinals.cache](https://github.com/ordbase/ordinals.cache)   
into an (sql) database e.g. `ord.db`: 


``` ruby
require 'ordlite'

OrdDb.connect( adapter:  'sqlite3',
               database: './ord.db' )

OrdDb.create_all     # build table schema

cache_dir = './ordinals.cache/btc'
cache =  OrdDb::Cache.new( cache_dir )
cache.import_all


puts
puts "  #{Inscribe.count} inscribe(s)"
puts "  #{Blob.count} blob(s)"

#=>  8505 inscribe(s)
#=>  7611 blob(s)
```


## License

The scripts are dedicated to the public domain.
Use it as you please with no restrictions whatsoever.



Please post in the #generative-orc-721 channel
in the ordinal punks discord.
For an invite
see <https://twitter.com/OrdinalPunks/status/1620230583711576068>.

