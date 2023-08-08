#####
#  generate collection page
#
#  to run use:
#    $ ruby pages/diyapes.rb


require_relative 'helper'
require_relative 'collection'     ## use/pull-in (shared) code




page = generate_collection(
    slug: 'diyapes',
    name: 'D.I.Y. Ape',
   )


write_text( "./tmp/orc721/diyapes/README.md",
              page )

puts 'bye'
