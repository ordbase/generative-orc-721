#####
#  generate inscriptions.json dataset
##    for ordinals wallet et al
#
#  to run use:
#    $ ruby market/diymaxibiz.rb



require 'cocos'      ## quick starter ruby "standard" library
                     ##  cocos == code commons
                     ##  see https://rubygems.org/gems/cocos


require_relative 'market'     ## use/pull-in (shared) code



inscriptions = generate_inscriptions(
                      slug: 'diymaxibiz',
                      max: 100,
                      name: 'D.I.Y. Maxi Biz (Punk)',
                      include_images: true,
                      include_attributes: true,
                      include_dna: true
                     )




write_json( "./market/diymaxibiz_inscriptions.json",
             inscriptions )


puts 'bye'
