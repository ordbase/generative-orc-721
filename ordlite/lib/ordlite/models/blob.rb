
module OrdDb
    module Model
  
  class Blob < ActiveRecord::Base
    belongs_to :inscribe, foreign_key: 'id'
  end  # class Blob
  
    end # module Model
end # module OrdDb
  