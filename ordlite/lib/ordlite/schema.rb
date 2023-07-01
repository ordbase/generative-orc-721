

module OrdDb

class CreateDb

def up

ActiveRecord::Schema.define do


=begin
   CREATE TABLE inscribes(
    id varchar NOT NULL PRIMARY KEY, 
    num integer NOT NULL, 
    content_length integer NOT NULL, 
    content_type varchar NOT NULL, 
    date datetime(6) NOT NULL, 
    sat integer NOT NULL, 
    height integer NOT NULL, 
    fee integer NOT NULL, 
    tx varchar NOT NULL, 
    offset integer NOT NULL, 
    address varchar NOT NULL, 

    created_at datetime(6) NOT NULL, 
    updated_at datetime(6) NOT NULL)

  CREATE TABLE blobs(
    id varchar NOT NULL PRIMARY KEY, 
    content blob NOT NULL
    
    created_at datetime(6) NOT NULL, 
    updated_at datetime(6) NOT NULL)
=end



create_table :inscribes, :id => :string do |t|    
    ## "id": "0a3a4dbf6630338bc4df8e36bd081f8f7d2dee9441131cb03a18d43eb4882d5ci0",
    ## note: change to uuid (universally unique id) - why? why not?
    ##        id gets used by row_id (internal orm db machinery) and is int
   ## t.string   :uuid,  null: false, index: { unique: true, name: 'inscribe_uuids' }

   ## "title": "Inscription 10371414",
   ##   note: use num/no. from title only - why? why not?
    t.integer  :num, null: false, index: { unique: true, name: 'inscribe_nums' }
   
    ##  "content length": "85 bytes",
    ## note:  extract bytes as integer!!!
    t.integer  :content_length, null: false
    ## "content type": "text/plain;charset=utf-8",
    ## note: make sure always lower/down case!!!
    t.string   :content_type, null: false

    ## "timestamp": "2023-06-01 05:00:57 UTC"
    ##   or use date_utc ???
    t.datetime :date, null: false

    ##
    ## "sat": "967502783701719",
    t.integer    :sat, null: false

    ##
    ## "genesis height": "792337",
    ## "genesis fee": "6118",
    ## "genesis transaction": "0a3a4dbf6630338bc4df8e36bd081f8f7d2dee9441131cb03a18d43eb4882d5c",
    ## "offset": "0"
    t.integer    :height, null: false
    t.integer    :fee, null: false
    t.string     :tx, null: false
    t.integer    :offset, null: false 
   
    ###
    ## "address": "bc1p3h4eecuxjj2g72sq38gyva732866u5w29lhxgeqfe6c0sg8xmagsuau63k",
    ##    is this minter/inscriber addr??? 
    t.string     :address, null: false

    ## -- ignore for now - why? why not?
    ##   what is output  ???
    ## "location": "0a3a4dbf6630338bc4df8e36bd081f8f7d2dee9441131cb03a18d43eb4882d5c:0:0",
    ## "output": "0a3a4dbf6630338bc4df8e36bd081f8f7d2dee9441131cb03a18d43eb4882d5c:0",
    ##  "output value": "546",
  
  ## timestamp at last
  t.timestamps
end


create_table :blobs, :id => :string do |t|
    ## "id": "0a3a4dbf6630338bc4df8e36bd081f8f7d2dee9441131cb03a18d43eb4882d5ci0",
    ## note: change to uuid (universally unique id) - why? why not?
    ##        id gets used by row_id (internal orm db machinery) and is int
    ## t.string   :id,  null: false, index: { unique: true, name: 'blob_uuids' }
 
    t.binary     :content,   null: false

  ## timestamp at last
  t.timestamps
end


end # block Schema.define

end # method up
end # class CreateDb
end # module OrdDb
