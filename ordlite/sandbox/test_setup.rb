####
# to run use:
#   $ ruby -I ./lib sandbox/test_setup.rb

require 'ordlite'



OrdDb.setup_in_memory_db



b1 = Blob.create( id: 'id123', content: 'c123')
b2 = Blob.create( id: 'id999', content: 'c999')

i1 = Inscribe.create( id: 'id999', 
                      num: 999,
                      content_length: 444,
                      content_type: 'text',
                      date: Time.now,
                      sat: 967502783701719,
                    height: 792337,
                      fee: 6118,
                      tx: '0a3a4dbf6630338bc4df8e36bd081f8f7d2dee9441131cb03a18d43eb4882d5c',
                        offset: 0,
                      address: 'bc1p3h4eecuxjj2g72sq38gyva732866u5w29lhxgeqfe6c0sg8xmagsuau63k',
)  


puts i1.blob.content
puts i1.blob.id
puts i1.blob.inscribe.id

puts b2.inscribe.num
puts b2.inscribe.height
puts b2.inscribe.content_type


b3 = Blob.create( id: 'id3', content: 'c99999')


puts "bye"