#####
#  generate collection page
#
#  to run use:
#    $ ruby market/diypunks_page.rb



require 'cocos'      ## quick starter ruby "standard" library
                     ##  cocos == code commons
                     ##  see https://rubygems.org/gems/cocos


require_relative 'page'     ## use/pull-in (shared) code



page = generate_page(
                      slug: 'diypunks',
                      max: 721,
                      name: 'D.I.Y. Punk'
                     )



write_text( "./market/tmp/diypunks/README.md",
             page )


puts 'bye'
