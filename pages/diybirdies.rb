#####
#  generate collection page
#
#  to run use:
#    $ ruby pages/diybirdies.rb

require_relative 'helper'
require_relative 'collection'     ## use/pull-in (shared) code



page = generate_collection(
    slug: 'diybirdies',
    name: 'D.I.Y. Birdie',
   )


write_text( "./tmp/orc721/diybirdies/README.md",
              page )

puts 'bye'
