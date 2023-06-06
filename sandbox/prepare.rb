require 'cocos'


## get inscription  links
## e.g.
## https://ordinals.com/inscription/e8830c5fbdfc2f529350fd04a2ac20bb097dce98f159223837513ae3c8d05714i0
##  and export as tabular dataset (in .csv)


=begin
### diypunks
pages = (1..12).to_a
pp pages

txt = ""

pages.each do |page|
  txt <<  read_text( "./sandbox/tmp/page#{page}.html" )
  txt << "\n\n\n"
end
=end



### diycoolcats
pages = (1..5).to_a
pp pages

txt = ""

pages.each do |page|
  txt <<  read_text( "./sandbox/tmp/cat#{page}.html" )
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
  '4ff81989f669faa1cde068743fa53136f7805d5b09718ca988e36a8c3d7f5190i0',
  'ade6f970e70fa4da06a227f7cb8fff1924390f994592c063ecc8671bcab586a7i0',
  '8330512cc1b08f2c844e6be7a73f133044094942ada31c84033508eb1cd548cei0',
  '4bdab09f7508b45d4df4a2677b120557e78d41ae89cab15c0303653eb49cab96i0',
  'e76936f3e096a4b2eb545185d86bd8950b4ae4072cd62337a804892aeb9a65e3i0',
  '9b68b336c9e07fcf85f9aff9bbb59e9877de8cd08cdd8a6494a724bb051fdb14i0',
  'fe61efa6b5a85c6f26e892b9f62952fcbe9233d9ab0d8f555c6234f1d079ec9ci0',
  '6669d2283c6cff973b102d58a81dfbce7365d8b4352cf7b15fd6516e90058abci0',
  'c646b234e10a64748a24c488df691cb671534bb6b0b7f132209de1e0d48907e0i0',
  '66154a522122517b8284deecc8091e5cf778ff6467df156849ce9affd53f2903i0',
  '68e6a40b360ef8b9bcd2311a975cbf9289dc05eaa6f69a81c6084c2d1a5a74a9i0',

  ## broken => [3.4.59] - dot and not commas?
  '368de1d3702a41b05019d3c377ce86055333dde2d41ae5498ab7b7e0cc64923ei0',

  ## more than one mint!!!
  ## https://ordinals.com/inscription/b0bce70a88f94f1be1cebca3cc324a966eed09299ea73b8c9dac84e05ea0cf1ci0
  'b0bce70a88f94f1be1cebca3cc324a966eed09299ea73b8c9dac84e05ea0cf1ci0',

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


write_text( "./sandbox/tmp/ordinals.csv", buf )

puts "bye"
