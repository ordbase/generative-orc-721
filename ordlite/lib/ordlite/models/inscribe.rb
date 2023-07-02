
module OrdDb
    module Model
  
  class Inscribe < ActiveRecord::Base
    has_one :blob, foreign_key: 'id'

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
  end  # class Inscribe
  
    end # module Model
end # module OrdDb
  