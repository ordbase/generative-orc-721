
module Ordinals

class Cache

def initialize( dir )
  @dir   = dir   
  @force = false
  @delay_in_s = 0.5  ## wait 0.5s before next (possible) request
  @requests = 0
end



def json_to_txt( data )
  buf = ''
  data.each do |k,v|
    next if ['preview', 'content'].include?( k )
    buf << "#{k.gsub( ' ', '-')}: #{v}\n"
  end
  buf
end


HEADER_RX = /\A(?<key>[a-z][a-z0-9_-]*)
                 :
                 [ ]*
               (?<value>.+?)    ## non-greedy
              \z
             /x

def read_headers( path )
  txt = read_text( path )
  h = {}
  txt.each_line do |line|
    line = line.strip
    ## skip empty and comment lines
    next if line.empty? || line.start_with?( '#' )

    if m=HEADER_RX.match(line)
      key   = m[:key]
      value = m[:value]
      
      h[key] = value
   else 
      puts "!! ERROR - parse error - no header pattern match for:"
      puts line
      exit 1
   end
  end
  h
end





def add( id )
   ## step 1)  get metadata records
   meta_path    = "#{@dir}/#{id[0,2]}/#{id[2..-1]}.meta.txt"
      
   meta = nil
   if !@force && File.exist?( meta_path )
      meta = read_headers( meta_path )
      print "."
   else
      print " meta-#{id} "
      sleep( @delay_in_s )   if @delay_in_s && @requests > 0 
 
      ## fetch and cache in cache
      meta = Ordinals.inscription( id )
      pp meta
      meta_txt = json_to_txt( meta )
      
      write_text( meta_path, meta_txt )
      @requests += 1
   end
      
      
   content_type = meta['content-type']
   extname =  if content_type.start_with?( 'text/plain' )
                '.txt'
              elsif content_type.start_with?( 'application/json' )
                '.json'
              elsif content_type.start_with?( 'image/png' )
                '.png'
              else
                puts "!! ERROR - unexpected content type; got: #{content_type}"
                ## pp meta
                exit 1
              end
      
      
   path    = "#{@dir}/#{id[0,2]}/#{id[2..-1]}#{extname}"
   if !@force && File.exist?( path )
       ## puts "  in cache"
       print "."
   else
       print " blob-#{id} "
       sleep( @delay_in_s )   if @delay_in_s && @requests > 0 
       
       ## note: save text as blob - byte-by-byte as is  (might be corrupt text)
       content = Ordinals.content( id )
       ##  pp content
       ## puts "data:"
       ## puts content.data
      
       write_blob( path, content.data )
   end
end # method add


def _prepare_csv( path )
  ids = []
  recs = read_csv( path )
  recs.each do |rec|
    ids << rec['id']
  end
  ids
end

def add_csv( path )
  ids = _prepare_csv( path )
  ids = ids.uniq  ## make uniq by default - why? why not?
  puts "   #{ids.size} inscribe id(s)"
  ids.each { |id| add(id) } 
end



## get inscription  links
## e.g.
##    inscription/e8830c5fbdfc2f529350fd04a2ac20bb097dce98f159223837513ae3c8d05714i0

=begin
INSCRIBE_ID_RX = %r{
              /b   # boundry (non-alphanum)
                 (?<id>[a-f0-9]{64}i[0-9])
              /b   # boundry (non-alphanum)
            }ix
=end

INSCRIBE_ID_RX = %r{
                  inscription/(?<id>[a-fi0-9]+)
                 }ix


##
## strict rx gets:
##  168 inscribe id(s)
## 118 inscribe id(s) - unique
##
##  loose gets:
##   300 inscribe id(s)
##   250 inscribe id(s) - unique
##
##  /b for boundray NOT working - why? why not?


def _prepare_html( path )
    ids = []
    txt = read_text( path )
    txt.scan( INSCRIBE_ID_RX ) do |_|
      m = Regexp.last_match
    
      ids  << m[:id]
    end
    ids
end

def add_html( path )
    ids = _prepare_html( path )
    ids = ids.uniq  ## make uniq by default - why? why not?
    puts "   #{ids.size} inscribe id(s)"
    ids.each { |id| add(id) } 
end

def _prepare_dir( dir )
    ids = []

   ## in html format
   pages = Dir.glob( "#{dir}/**/*.html")
   pages.each do |path|
     ids += _prepare_html( path )
   end
      
   ### in csv format
   datasets = Dir.glob( "#{dir}/**/*.csv")
   datasets.each do |path|
     ids += _prepare_csv( path )
   end
      
   ids
end

def add_dir( dir )
    ids = _prepare_dir( dir )
    puts "   #{ids.size} inscribe id(s)"      
    ## turn into symbol (to make uniq work ??)
    ids = ids.uniq
    pp ids
    puts "   #{ids.size} inscribe id(s) - unique"
    ids.each { |id| add(id) } 
end


end # class Cache
end  # module Ordinals