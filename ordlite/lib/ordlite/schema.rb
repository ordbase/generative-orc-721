

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
    ##    change to bytes - why? why not?
    t.integer  :bytes, null: false
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
    ##   -> change height to block - why? why not?
    ## "genesis fee": "6118",
    ## "genesis transaction": "0a3a4dbf6630338bc4df8e36bd081f8f7d2dee9441131cb03a18d43eb4882d5c",
    ## "offset": "0"
    t.integer    :block, null: false
    t.integer    :fee, null: false
    t.string     :tx, null: false
    t.integer    :offset, null: false 
   
    ###
    ## "address": "bc1p3h4eecuxjj2g72sq38gyva732866u5w29lhxgeqfe6c0sg8xmagsuau63k",
    ##    is this minter/inscriber addr??? 
    t.string     :address, null: false

    ## "output": "0a3a4dbf6630338bc4df8e36bd081f8f7d2dee9441131cb03a18d43eb4882d5c:0",
    ##  "output value": "546",
    t.string   :output, null: false
    t.integer  :value,  null: false

    ## -- ignore for now - why? why not?
    ##   what is location  ???
    ## "location": "0a3a4dbf6630338bc4df8e36bd081f8f7d2dee9441131cb03a18d43eb4882d5c:0:0",

  ## timestamp last
  t.timestamps
end


create_table :blobs, :id => :string do |t|
    ## "id": "0a3a4dbf6630338bc4df8e36bd081f8f7d2dee9441131cb03a18d43eb4882d5ci0",
    ## note: change to uuid (universally unique id) - why? why not?
    ##        id gets used by row_id (internal orm db machinery) and is int
    ## t.string   :id,  null: false, index: { unique: true, name: 'blob_uuids' }
 
    t.binary     :content,   null: false

  ## timestamp last
  t.timestamps
end

create_table :collections, :id => :string do |t|
  t.string   :name
  t.integer  :max        # max limit
  t.integer  :maxblock   # max block limit
  t.string   :dim        # dimension e.g. 24x24 (in px)

  t.string   :inscribe_id,  null: false   ## foreign key reference

  ## timestamp last
  t.timestamps
end

#####
## join table (collections has_many modules)
##   rename to layer / sprites / blocks / tiles / modules / submodules / subs / mods / ...etc - why? why not?
##             layerlists or inscribelists or ???
create_table :inscriberefs, :id => false do |t|
  t.string  :collection_id, null: false
  t.string  :inscribe_id,   null: false
  t.integer :pos,           null: false    ## position (index) in list (starting at 0)
  ## todo/fix: make collection_id + inscribe_id + pos unique index - why? why not?

  ## timestamp last
  t.timestamps
end


create_table :generatives, :id => :string do |t|
  t.string  :collection_id, null: false
  t.string  :g,             null: false  ##  use space separated numbers - why? why not?    
  t.binary  :content    ### optional for now - why? why not?
 
  ## timestamp last
  t.timestamps
end




end # block Schema.define

end # method up
end # class CreateDb

###
#  migrations helpers
class AddGeneratives

def up  
  ActiveRecord::Schema.define do
    create_table :generatives, :id => :string do |t|
      t.string  :collection_id, null: false
      t.string  :g,             null: false  ##  use space separated numbers - why? why not?    
      t.binary  :content    ### optional for now - why? why not?
     
      ## timestamp last
      t.timestamps
    end
  end # block Schema.define
end # method up
end # class AddGeneratives
  
end # module OrdDb
