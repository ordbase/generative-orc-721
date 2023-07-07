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

txt =<<TXT
og deploy diymaxibiz
name: D.I.Y. Maxi Biz (Punks)
max: 100
dim: 24x24
ad56d4f242677ac334844002f1c27b9b636ba71f68590cdc0cc5a2cbce080990i0
TXT

data = {
  'p'   => 'orc-721',
  'op'  =>'deploy',
  'slug'=>'diymaxibiz',
  'name'=>'D.I.Y. Maxi Biz (Punks)',
  'max' =>100,
  'dim' =>'24x24',
  'generative'=>[
      'ad56d4f242677ac334844002f1c27b9b636ba71f68590cdc0cc5a2cbce080990i0'
   ]}

  assert_equal  data, OG.parse_deploy( txt )
end


def test_parse_mint
  txt = 'og mint diyphunks 0 49 28'

  data = {
      'p'   => 'orc-721',
      'op'  =>'mint',
      's'=>'diyphunks',
      'g' => [0,49,28],
    }

    assert_equal  data, OG.parse_mint( txt )
end


end # class TestOg