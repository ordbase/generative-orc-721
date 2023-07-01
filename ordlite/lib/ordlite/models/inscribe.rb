
module OrdDb
    module Model
  
  class Inscribe < ActiveRecord::Base
    has_one :blob, foreign_key: 'id'
  end  # class Inscribe
  
    end # module Model
end # module OrdDb
  