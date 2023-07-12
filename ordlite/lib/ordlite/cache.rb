
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
     ## puts "==> inscribe #{i+1}/#{paths.size}..."
     data = _read_inscribe( path )
     
     id = data['id']

     ## skip if exists (use update later - why? why not?)
     rec = Inscribe.find_by( id: id )
     if rec 
      ## skip - already in db
        print '.'
     else
        print " #{id}"  #  NEW - add / insert into db"
        Inscribe.create_from_cache( data )
     end
   end
   puts


   paths = Dir.glob( "#{@dir}/content/**.txt" )
   puts "  #{paths.size} content datafile(s) found"

   paths.each_with_index do |path, i|
      ## puts "==> blob #{i+1}/#{paths.size}..."
      content = _read_blob( path )
      id      = File.basename( path, File.extname( path ))
  
      rec = Blob.find_by( id: id )
      if rec
        ## skip - already in db
        print '.'
      else
         print " #{id}"   # NEW - add / insert into db"
         Blob.create( id: id,
                      content: content )
      end
    end
    puts
end


def import( id )
   data = read( id )  
   rec = Inscribe.create_from_cache( data )
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

end # class Cache
end # module OrdDb




