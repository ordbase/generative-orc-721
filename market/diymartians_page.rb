#####
#  generate inscriptions.json dataset
##    for ordinals wallet et al
#
#  to run use:
#    $ ruby market/diymartians.rb



require 'cocos'      ## quick starter ruby "standard" library
                     ##  cocos == code commons
                     ##  see https://rubygems.org/gems/cocos


require_relative 'page'     ## use/pull-in (shared) code


page = generate_page(
    slug: 'diymartians',
    max: 100,
    name: 'D.I.Y. Martian',
   )


write_text( "./market/tmp/diymartians/README.md",
             page )


puts 'bye'
