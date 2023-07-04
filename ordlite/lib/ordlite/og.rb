


module Og


  OG_DEPLOY_RX = /\A
     og
     [ ]+
     deploy
     [ ]+
     /x

  def self.is_deploy?( txt )
    OG_DEPLOY_RX.match( text ) != nil
  end
  class << self
     alias_method :deploy?, :is_deploy?
  end


 HEADER_RX = /\A(?<key>[a-z]+)
                 [ ]*:
                 [ ]*
               (?<value>.+?)    ## non-greedy
              \z
             /x

def self.parse_deploy( txt )
## for now convert to orc-721 format (json-like) - why? why not

  data = {}
  ## note: chom will remove trailing newline (\n)
  lines = txt.lines( chomp: true )
  ## strip (remove leading and trailing spaces too)
  lines = lines.map {|line| line.strip }
  ## remove empties  (e.g. "")
  lines = lines.reject {|line| line.empty? }
  
  values = lines[0].split( /[ ]+/ )

  ## note: change og to orc-721
  data['p']  = values[0] == 'og' ? 'orc-721' : values[0]  
  data['op'] = values[1]
  data['slug'] = values[2] 

  process_headers = true
  lines[1..-1].each do |line|
     m = nil
     if process_headers && (m=HEADER_RX.match(line))
        key   = m[:key]
        value = m[:value]
        
        ## auto-convert known (integer number) keys to integenr number
        value = value.to_i(10)  if ['max'].include?( key )
        data[key] = value
     else 
       ## assume generatives for the rest
       data['generative'] ||= []
       data['generative'] << line 
       process_headers = false
     end    
  end
  data
end
end  # module Og

## add alias - why? why not?
OG = Og

