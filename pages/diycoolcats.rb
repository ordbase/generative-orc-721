#####
#  generate collection page
#
#  to run use:
#    $ ruby pages/diycoolcats.rb

require_relative 'helper'
require_relative 'collection'     ## use/pull-in (shared) code



page = generate_collection(
    slug: 'diycoolcats',
    name: 'D.I.Y. Cool Cat',
   )


write_text( "./tmp/orc721/diycoolcats/README.md",
              page )

puts 'bye'
