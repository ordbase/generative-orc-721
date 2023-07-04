


module Og

  OG_MINT_RX = /\A
     og
     [ ]+
     mint
     [ ]+
     /x

  OG_DEPLOY_RX = /\A
     og
     [ ]+
     deploy
     [ ]+
     /x


  def self.is_mint?( txt )  OG_MINT_RX.match( txt ) != nil; end
  def self.is_deploy?( txt )  OG_DEPLOY_RX.match( txt ) != nil; end


  class << self
    alias_method :mint?, :is_mint?
    alias_method :deploy?, :is_deploy?
  end



## single-line for now
OG_MINT_SLUG_NUMS_RX = /\A
            og
           [ ]+
            mint
           [ ]+
             (?<slug>[a-z][a-z0-9]*)
           [ ]+
            (?<nums>[0-9]+
                 ([ ]+[0-9]+)*
             )
          \z/x


def self.parse_mint( txt )
  data = {}
  lines = _lines( txt )

  ## try to convert to json
  m=OG_MINT_SLUG_NUMS_RX.match( lines[0] )

  ### FIX: report/ log error
  ###   raise parse error - why? why not?
  if m.nil?  
     puts "!! ERROR NO MATCH OG_MINT_SLUG_NUMS:"
     pp lines
     exit 1
  end
            
  data['p'] = 'orc-721'
  data['op'] = 'mint'
  data['s']  = m[:slug]
  data['g']  = m[:nums].split( /[ ]+/).map {|num| num.to_i(10) }
 
  data
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
  lines = _lines( txt )
  
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


def self._lines( txt )
  ## note: chomp will remove trailing newline (\n)
  lines = txt.lines( chomp: true )
  ## strip (remove leading and trailing spaces too)
  lines = lines.map {|line| line.strip }
  ## remove empties  (e.g. "")
  lines = lines.reject {|line| line.empty? }
  lines
end


end  # module Og

## add alias - why? why not?
OG = Og

