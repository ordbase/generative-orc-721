
module OrdDb


class  Cache   

   Inscribe = Model::Inscribe
   Blob     = Model::Blob

def initialize( dir='.' )
    @dir = dir
end



def import_all   
   paths = Dir.glob( "#{@dir}/**.json" )
   puts "  #{paths.size} inscribe datafile(s) found"

   paths.each_with_index do |path, i|
     puts "==> inscribe #{i+1}/#{paths.size}..."
     data = _read_inscribe( path )
     
     Inscribe.create( _parse_inscribe( data ))
   end


   paths = Dir.glob( "#{@dir}/content/**.txt" )
   puts "  #{paths.size} content datafile(s) found"

   paths.each_with_index do |path, i|
      puts "==> blob #{i+1}/#{paths.size}..."
      content = _read_blob( path )
      id      = File.basename( path, File.extname( path ))
      
      Blob.create( id: id,
                   content: content )
    end
end


def import( id )
   data = read( id )  
   rec = Inscribe.create( _parse_inscribe( data ))
   rec
end

def read( id )
   _read_inscribe( "#{@dir}/#{id}.json" ) 
end

def _read_inscribe( path )
   JSON.parse( _read_text( path )) 
end

def _read_blob( path )
   blob = File.open( path, 'rb' ) { |f| f.read } 
   ## auto force to ASCII-7BIT if not already - why? why not?
   blob
end


def _read_text( path )
   File.open( path, 'r:utf-8' ){ |f| f.read } 
end

def _parse_inscribe( data )
   ## num via title
   attributes = {
    id:  data['id'],
    num: _title_to_num( data['title'] ),
    bytes: _content_length_to_bytes( data['content length'] ), 
    sat:  data['sat'].to_i(10),
    content_type:  data['content type'],
    block: data['genesis height'].to_i(10),
    fee: data['genesis fee'].to_i(10),
    tx: data['genesis transaction'],
    address: data['address'],
    output: data['output'],
    value: data['output value'].to_i(10),
    offset: data['offset'].to_i(10),
    # "2023-06-01 05:00:57 UTC"
    date:  DateTime.strptime( data['timestamp'], 
                              '%Y-%m-%d %H:%M:%S %z')
  }

  attributes
end



    ##  "title": "Inscription 9992615",
TITLE_RX = /^Inscription (?<num>[0-9]+)$/i

def _title_to_num( str )
   if m=TITLE_RX.match( str )
      m[:num].to_i(10)    ## use base 10
   else
     puts "!! ERROR - no inscribe num found in title >#{str}<"
     exit 1   ## not found - raise exception - why? why not?
   end
end

CONTENT_LENGTH_RX = /^(?<num>[0-9]+) bytes$/i

def _content_length_to_bytes( str )
    if m=CONTENT_LENGTH_RX.match( str )
       m[:num].to_i(10)    ## use base 10
    else
       puts "!! ERROR - bytes found in content lenght >#{str}<"
       exit 1   ## not found - raise exception - why? why not?
    end
end
 



end # class Cache
end # module OrdDb




