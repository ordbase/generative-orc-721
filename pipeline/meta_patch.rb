require 'cocos'
####
#
#  add inscription content "by hand" - not yet availabe via api
#       MUST verify/ auto-download later from ordinals.com


inscribes = [
  ['c04ec3dd63474e754a7b93606485dee7337548f5421770108e7c2726603b672ai0',
    %Q<{"p":"orc-721","op":"mint","s":"btcwords","g":[11, 49, 68, 98, 111, 153]}>
  ],
  ['4388fb10fef324b4c548153a8637fafa42fa22c2548488b6832dd6df9d75886di0',
    %Q<{"p":"orc-721","op":"mint","s":"btcwords","g":[7, 49, 68, 98, 111, 153]}>
  ]
]

pp inscribes



cache_dir = '../ordinals.cache/btc'



inscribes.each_with_index do |(id,content), i|
  puts "==> #{i} - #{id}"


  ## todo/fix: check if metadata available?
  ##              check for content type etc.

   ## step 2) get content - check for mime type - text/
   ##   note - save appliation/json as .txt for now too - why? why not?

   path    = "#{cache_dir}/content/#{id}.txt"
   puts "data:"
   puts content

   write_blob( path, content )
end



puts "bye"