#####
#  generate collection page
#
#  to run use:
#    $ ruby market/orangepixels_page.rb



require 'cocos'      ## quick starter ruby "standard" library
                     ##  cocos == code commons
                     ##  see https://rubygems.org/gems/cocos


require_relative 'page'     ## use/pull-in (shared) code



page = generate_page(
                      slug: 'orangepixels',
                      max: 100,
                      name: 'Orange Pixels'
                     )



write_text( "./market/tmp/orangepixels/README.md",
             page )


puts 'bye'
