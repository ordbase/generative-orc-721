######################
#  to run use
#   $  ruby  pipeline2/prepare.rb

require 'cocos'
require 'ordinals'


## get inscription  links
## e.g.
##    inscription/e8830c5fbdfc2f529350fd04a2ac20bb097dce98f159223837513ae3c8d05714i0



INSCRIBE_RX = %r{
              inscription/
                 (?<id>[a-fi0-9]+)
            }ix


def prepare_inscribes( dir )

  ## in html format
  pages = Dir.glob( "#{dir}/**/*.html")

  inscribes = []

  rx = INSCRIBE_RX
  pages.each do |path|
    txt = read_text( path )

    txt.scan( rx ) do |_|
      m = Regexp.last_match
  
      inscribes << m[:id].strip
    end
  end


  ### in csv format
  datasets = Dir.glob( "#{dir}/**/*.csv")

  datasets.each do |path|
    recs = read_csv( path )

    recs.each do |rec|
      inscribes << rec['id'].strip
    end
  end

  ## pp inscribes
  puts "   #{inscribes.size} inscribe(s)"

  ## turn into symbol (to make uniq work ??)
  inscribes = inscribes.uniq
  ## pp inscribes
  puts "   #{inscribes.size} inscribe(s) - unique"

  inscribes
end




ids = prepare_inscribes( './inbox' )


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

def read_props( path )
  txt = read_text( path )
  h = {}
  txt.each_line do |line|
    line = line.strip
    next if line.empty?
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


cache_dir = '../ordinals.cache/inscription'
delay_in_s = 0.5


ids.each_with_index do |id,i|
  ## puts "==> #{i+1}/#{ids.size} - #{id}"


  ## step 1)  get metadata records
  meta_path    = "#{cache_dir}/#{id[0,2]}/#{id[2..-1]}.meta.txt"

  meta = nil
   if File.exist?( meta_path )
       meta = read_props( meta_path )
       print "."
   else
       print " #{i+1}/#{ids.size}-#{id}"
       ## fetch and cache in cache
       meta = Ordinals.inscription( id )
       pp meta
       meta_txt = json_to_txt( meta )

       write_text( meta_path, meta_txt )

       sleep( delay_in_s )
   end


   extname = nil
   content_type = meta['content-type']
   if content_type.start_with?( 'text/plain' )
       extname = '.txt'
   elsif content_type.start_with?( 'application/json' )
       extname = '.json'
   elsif content_type.start_with?( 'image/png' )
       extname = '.png'
   else
     puts "!! ERROR - unexpected content type; got: #{content_type}"
     ## pp meta
     exit 1
   end


   path    = "#{cache_dir}/#{id[0,2]}/#{id[2..-1]}#{extname}"
   if File.exist?( path )
       ## puts "  in cache"
       print "."
   else
      ## note: save text as blob - byte-by-byte as is  (might be corrupt text)

      content = Ordinals.content( id )
      pp content
      #=> #<Ordinals::Api::Content:0x000001a1352df938
      #      @data="RIFF\xF8\v\x00\x00WEBPVP8 \xEC\v\x00\x00...",
      #      @length=3072,
      #      @type="image/png"

      puts "data:"
      puts content.data

      write_blob( path, content.data )

      sleep( delay_in_s )
   end
end
puts


puts "bye"

