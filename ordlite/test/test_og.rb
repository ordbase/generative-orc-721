###
#  to run use
#     ruby -I ./lib -I ./test test/test_og.rb


require 'helper'


class TestOg < MiniTest::Test

def test_parse_deploy
txt =<<TXT
og deploy diyphunks
name: D.I.Y. Phunks
max: 100
dim: 24x24
dd91c8b33dd19ccd8410e54c2099bfd50d4f777a186ee974fe4c15420c42ea0fi0
TXT

  data = {
    'p'   => 'orc-721',
    'op'  =>'deploy',
    'slug'=>'diyphunks',
    'name'=>'D.I.Y. Phunks',
    'max' =>100,
    'dim' =>'24x24',
    'generative'=>[
        'dd91c8b33dd19ccd8410e54c2099bfd50d4f777a186ee974fe4c15420c42ea0fi0'
     ]}

  assert_equal  data, OG.parse_deploy( txt ) 
end



end # class TestOg