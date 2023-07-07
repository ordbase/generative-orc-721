#####
#  generate inscriptions.json dataset
##    for ordinals wallet et al
#
#  to run use:
#    $ ruby market/diymaxibiz_page.rb



require 'cocos'      ## quick starter ruby "standard" library
                     ##  cocos == code commons
                     ##  see https://rubygems.org/gems/cocos


require_relative 'page'     ## use/pull-in (shared) code


page = generate_page(
    slug: 'diymaxibiz',
    max: 100,
    name: 'D.I.Y. Maxi Biz',
   )


write_text( "./market/tmp/diymaxibiz/README.md",
             page )


puts 'bye'
