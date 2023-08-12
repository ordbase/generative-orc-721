#####
#  generate collection page
#
#  to run use:
#    $ ruby pages/btcwords.rb

require_relative 'helper'
require_relative 'collection'     ## use/pull-in (shared) code



page = generate_collection(
    slug: 'btcwords',
    name: 'Word on Bitcoin',
   )


write_text( "./tmp/orc721/btcwords/README.md",
              page )

puts 'bye'
