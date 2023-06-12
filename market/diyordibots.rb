#####
#  generate inscriptions.json dataset
##    for ordinals wallet et al
#
#  to run use:
#    $ ruby market/diyordibots.rb



require 'cocos'      ## quick starter ruby "standard" library
                     ##  cocos == code commons
                     ##  see https://rubygems.org/gems/cocos


require_relative 'market'     ## use/pull-in (shared) code



##
# note: for name use SINGULAR used for:
#   e.g. D.I.Y. Ordibot #0
#        D.I.Y. Ordibot #1
#        D.I.Y. Ordibot #2
#        ...

inscriptions = generate_inscriptions(
                      slug: 'diyordibots',
                      max: 1000,
                      name: 'D.I.Y. Ordibot'
                     )




write_json( "./market/diyordibots_inscriptions.json",
             inscriptions )


puts 'bye'
