#####
#  generate inscriptions.json dataset
##    for ordinals wallet et al
#
#  to run use:
#    $ ruby market/diypunks.rb



require 'cocos'      ## quick starter ruby "standard" library
                     ##  cocos == code commons
                     ##  see https://rubygems.org/gems/cocos


require_relative 'market'     ## use/pull-in (shared) code



inscriptions = generate_inscriptions(
                      slug: 'diypunks',
                      max: 721,
                      name: 'D.I.Y. Punk',
                      include_images: true,
                      include_attributes: true,
                      include_dna: true
                     )




write_json( "./market/diypunks_inscriptions.json",
             inscriptions )


puts 'bye'
