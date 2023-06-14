require 'cocos'


## get inscription  links
## e.g.
##    inscription/e8830c5fbdfc2f529350fd04a2ac20bb097dce98f159223837513ae3c8d05714i0
##  and export as tabular dataset (in .csv)




LINK_RX = %r{
              inscription/
                 (?<link>[a-fi0-9]+)
            }ix


def prepare_inscribes( slug, page_id, page_count )

  pages = (1..page_count).to_a
  pp pages

  txt = ""

  pages.each do |page|
    txt <<  read_text( "./sandbox/tmp/#{page_id}#{page}.html" )
    txt << "\n\n\n"
  end

  links = []


  rx = LINK_RX
  txt.scan( rx ) do |_|
    m = Regexp.last_match

    links <<  m[:link].strip
  end


  ## pp links
  puts "   #{links.size} link(s)"

  ## turn into symbol (to make uniq work ??)
  links = links.uniq
  ## pp links
  puts "   #{links.size} link(s) - unique"

  ## exclude
  ## links = links.reject { |link| EXCLUDES.include?( link ) }
  ## puts "   #{links.size} link(s)"


  recs = []
  links.each_with_index do |id, i|
     recs << [id]
  end

  headers = ['id']
  buf = String.new('')
  buf << headers.join( ', ' )
  buf << "\n"
  recs.each do |values|
    buf << values.join( ', ' )
    buf << "\n"
  end

  outpath = "./sandbox/tmp/ordinals.#{slug}.csv"

  puts "  saving >#{outpath}<..."
  write_text( outpath, buf )
end





pages = {
#  'diypunks'    => [ 'page', 31 ],
#  'diypunks-v2' => [ 'punk-ii/', 33 ],
#  'diyordibots' => [ 'bot', 44 ],
#   'diycoolcats' => [ 'cat', 27 ],
#    'btcwords' => [ 'word/', 32 ],
#  'diyordibots-v2' => [ 'iibot/', 40 ],
#   'diybirdies'  => [ 'bird/', 12 ],
    'diyapes' => [ 'ape/', 4 ],
}


pages.each_with_index do |(slug, h),i|
    puts "==>  [#{i+1}] #{slug} - #{h[1]} page(s)  ..."

    prepare_inscribes( slug, *h )   ## if i == 0
end




puts "bye"

