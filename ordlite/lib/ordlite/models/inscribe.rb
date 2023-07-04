
module OrdDb
    module Model
  
  class Inscribe < ActiveRecord::Base
    has_one :blob, foreign_key: 'id'
    has_one :collection    ## optional (auto-added via og/orc-721 deploy)
    has_one :generative, foreign_key: 'id'   ## optional (auto-added via og/orc-721 deploy)


    def content
      ## convernience helper
      ##  forward to blob.content
       blob.content
    end

    ################################
    ### scope like helpers
    def self.deploys 
      where_clause =<<SQL 
content LIKE '%deploy%' 
AND (   content LIKE '%orc-721%' 
     OR content LIKE '%og%')
SQL

       joins(:blob).where( where_clause ).order( 'num' )
    end

    def self.deploys_by( slug: )
             where_clause =<<SQL 
content LIKE '%deploy%' 
AND (   content LIKE '%orc-721%' 
     OR content LIKE '%og%')
AND content LIKE '%#{slug}%'     
SQL

      joins(:blob).where( where_clause ).order( 'num' )
    end

    def self.mints 
      where_clause =<<SQL 
content LIKE '%mint%' 
AND (   content LIKE '%orc-721%' 
     OR content LIKE '%og%')
SQL

       joins(:blob).where( where_clause ).order( 'num' )
    end

    def self.mints_by( slug: ) 
      where_clause =<<SQL 
content LIKE '%mint%' 
AND (   content LIKE '%orc-721%' 
     OR content LIKE '%og%')
AND content LIKE '%#{slug}%'     
SQL

       joins(:blob).where( where_clause ).order( 'num' )
    end


###
## add support for ordinals.com api json 



   def self.create_from_api( data ) create( _parse_api( data )); end
   class << self
     alias_method :create_from_cache, :create_from_api   ## add alias - why? why not?
     alias_method :create_from_json,  :create_from_api   ## add alias - why? why not?
   end

   
   def self._parse_api( data )   ## parse api json data
    ## num via title
    attributes = {
     id:  data['id'],
     num: _title_to_num( data['title'] ),
     bytes: _content_length_to_bytes( data['content length'] ), 
     sat:  data['sat'].to_i(10),
     content_type:  data['content type'],
     block: data['genesis height'].to_i(10),
     fee: data['genesis fee'].to_i(10),
     tx: data['genesis transaction'],
     address: data['address'],
     output: data['output'],
     value: data['output value'].to_i(10),
     offset: data['offset'].to_i(10),
     # "2023-06-01 05:00:57 UTC"
     date:  DateTime.strptime( data['timestamp'], 
                               '%Y-%m-%d %H:%M:%S %z')
   }
 
   attributes
 end
 
 
     ##  "title": "Inscription 9992615",
 TITLE_RX = /^Inscription (?<num>[0-9]+)$/i
 
 def self._title_to_num( str )
    if m=TITLE_RX.match( str )
       m[:num].to_i(10)    ## use base 10
    else
      puts "!! ERROR - no inscribe num found in title >#{str}<"
      exit 1   ## not found - raise exception - why? why not?
    end
 end
 
 CONTENT_LENGTH_RX = /^(?<num>[0-9]+) bytes$/i
 
 def self._content_length_to_bytes( str )
     if m=CONTENT_LENGTH_RX.match( str )
        m[:num].to_i(10)    ## use base 10
     else
        puts "!! ERROR - bytes found in content lenght >#{str}<"
        exit 1   ## not found - raise exception - why? why not?
     end
 end
  


  end  # class Inscribe
  
    end # module Model
end # module OrdDb
  