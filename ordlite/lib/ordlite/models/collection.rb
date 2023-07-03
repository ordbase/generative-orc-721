
module OrdDb
    module Model
  
  class Collection < ActiveRecord::Base
    belongs_to :inscribe
    
    has_many :inscriberefs, -> { order('pos') }  ## join table (use habtm - why? why not?)
    has_many :layers, :through => :inscriberefs,  
                      :source => :inscribe  
  end  # class Collection
  
    end # module Model
end # module OrdDb
  