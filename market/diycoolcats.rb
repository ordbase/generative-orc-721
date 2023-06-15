#####
#  generate inscriptions.json dataset
##    for ordinals wallet et al
#
#  to run use:
#    $ ruby market/diycoolcats.rb



require 'cocos'      ## quick starter ruby "standard" library
                     ##  cocos == code commons
                     ##  see https://rubygems.org/gems/cocos


require_relative 'market'     ## use/pull-in (shared) code



inscriptions = generate_inscriptions(
                      slug: 'diycoolcats',
                      max: 721,
                      name: 'D.I.Y. Cool Cat',
                      include_images: true
                     )




write_json( "./market/diycoolcats_inscriptions.json",
             inscriptions )


puts 'bye'
