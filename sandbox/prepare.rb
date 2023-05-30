require 'cocos'


## get inscription  links
## e.g.
## https://ordinals.com/inscription/e8830c5fbdfc2f529350fd04a2ac20bb097dce98f159223837513ae3c8d05714i0
##  and export as tabular dataset (in .csv)

pages = (1..4).to_a
pp pages



txt = ""

pages.each do |page|
  txt <<  read_text( "./sandbox/tmp/page#{page}.html" )
  txt << "\n\n\n"
end


## d.i.y. punk broken (or deploy)

EXCLUDES = [
  'e8830c5fbdfc2f529350fd04a2ac20bb097dce98f159223837513ae3c8d05714i0',
  '164c35ee1d24c1a779efa33ccdd83cc66bd5c330f2725f4646969ec7f1b1c20di0',
  '753f663770d816f61acd35da8dd04e122eec8582e93ca36b2122f2d4ac206089i0',

  ## broken => "p":"orc-721",
  'a4904231285e99aeb90734fa8f8d307f8537390f14cdd208093f2059192f10f1i0',
  '163ef5948ad8f5fe815cbb59b8fbbd7a899fb6606e831096363307a3601cac6ei0',
  'd79a1669653fc9ea4147c91ba9817e8c22545e6126d294bb725d7bea3d08322ai0',
  'c65796178fd1ecf9982add8f837f0ad80a50682f10e70c2340cf9093b2a64ff6i0',
  '52469aa5e05e357e23f6018f0781e4adf8054a6b20bfc3582711a4e59378b172i0',
  'd35173cd00b61619c51f488546ca0ad927df77c263d201dc2ce3e4b68c0d1857i0',
  '74cb1391974a585986f5423282c7b99f25a3617195e74c57409ca3c500e86acai0',

  ## broken => [3.4.59] - dot and not commas?
  '368de1d3702a41b05019d3c377ce86055333dde2d41ae5498ab7b7e0cc64923ei0',
]


LINK_RX = %r{
              inscription/
                 (?<link>[a-fi0-9]+)
            }ix


links = []


rx = LINK_RX
txt.scan( rx ) do |_|
  m = Regexp.last_match

  links <<  m[:link].strip
end


pp links

puts "   #{links.size} link(s)"


## turn into symbol (to make uniq work ??)
links = links.uniq
## pp links
puts "   #{links.size} link(s)"

## exclude
links = links.reject { |link| EXCLUDES.include?( link ) }
puts "   #{links.size} link(s)"


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


write_text( "./sandbox/tmp/ordinals.csv", buf )

puts "bye"
