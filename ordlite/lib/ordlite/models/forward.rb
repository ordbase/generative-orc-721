
### forward references
##   require first to resolve circular references

module OrdDb
  module Model

#############
# ConfDb
Prop      = ConfDb::Model::Prop


class Inscribe    < ActiveRecord::Base ; end
class Blob        < ActiveRecord::Base ; end
class Collection  < ActiveRecord::Base ; end
class Generative  < ActiveRecord::Base ; end


### join tables - add inline here - why? why not?
##   rename to CollectionLayer? or
##             CollectionInscribeRef? or
##             Layerref? or
##             InscribeRef?
class Inscriberef < ActiveRecord::Base
  belongs_to :collection
  belongs_to :inscribe
end

  end # module Model

  # note: convenience alias for Model
  # lets you use include OrdDb::Models
  Models = Model   
end # module OrdDb


