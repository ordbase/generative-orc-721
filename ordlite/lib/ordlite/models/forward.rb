
### forward references
##   require first to resolve circular references

module OrdDb
  module Model

#############
# ConfDb
Prop      = ConfDb::Model::Prop


class Inscribe    < ActiveRecord::Base ; end
class Blob        < ActiveRecord::Base ; end

  end

  # note: convenience alias for Model
  # lets you use include OrdDb::Models
  Models = Model   
end # module # OrdDb


