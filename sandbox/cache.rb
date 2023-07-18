##
# to run use:
#
#  $ ruby sandbox/cache.rb

##
#  reformat cache to new format

require 'cocos'


cache_dir = "../ordinals.cache"


datasets = Dir.glob( "#{cache_dir}/inscriptionxxx/**.json" )
puts "  #{datasets.size} dataset(s)"
#=> 8803 dataset(s)


=begin
datasets.each_with_index do |path,i|
  print "#{i+1}/#{datasets.size} "
  data = read_json( path )
  
  ## break if i > 10

  buf = ''

  data.each do |k,v|
      next if ['preview', 'content'].include?( k )
      buf << "#{k.gsub( ' ', '-')}: #{v}\n"
  end

  puts 
  basename = File.basename( path, File.extname( path)) 
  outpath = "#{cache_dir}/inscription/#{basename[0,2]}/#{basename[2..-1]}.meta.txt"
 
  puts "==> #{outpath}..."
  puts buf
 
  write_text( outpath, buf )
end
puts
puts
=end


contents = Dir.glob( "#{cache_dir}/inscriptionxxx/content/**.*" )
puts "  #{contents.size} content(s)"
#=>  7819 content(s)


contents.each_with_index do |path,i|
    ## break if i > 10

    blob = read_blob( path )
    basename = File.basename( path, File.extname( path)) 
 
    extname = nil
    meta = read_json( "#{cache_dir}/inscriptionxxx/#{basename}.json" )
    content_type  = meta['content type']
    content_length = meta['content length']
    puts "==> #{i+1}/#{contents.size} - >#{content_type}< #{content_length}..."
    if content_type.start_with?( 'text/plain' ) 
       extname = '.txt'
    elsif content_type.start_with?( 'application/json' )
       extname  = '.json'        
    else
      puts "!! ERROR - unsupported content type; sorry"
      exit 1
    end

    outpath = "#{cache_dir}/inscription/#{basename[0,2]}/#{basename[2..-1]}#{extname}"
 
    puts "==> #{outpath}..."
    puts blob
   
    write_blob( outpath, blob )  
end

puts "bye"
