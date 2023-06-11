
require 'json'   ## json module required

require_relative 'validate'




mint_inscribes = [
  [105,  %Q<{"p":"orc-721","op":"mint","s":"diypunks","g":[0]}>], #' OK'
  [5, %Q<{"p":"orc-721","op":"mint","s":"diypunks","g":[0]}>],   ## ERROR - mint ord num LOWER (<) deploy ord num
  [106, %Q<{"p":"orc-721","op":"mint","s":"diypunks","g":[]}>],  ## ERROR - g empty
  [107,  %Q<{"p":"orc-721","op":"mint","s":"diypunks","g":[0,59]}>],  ## OK
  [108,  %Q<{"p":"orc-721","op":"mint","s":"diypunks","g":[0,3,59,99]}>], ## ERROR - g out-of-range num
  [109,  %Q<{"p":"orc-721",}>],  ## ERROR -  json parse error / invalid - single-line - failed multi-line inscribe
  [110,  %Q<{"p":"orc-721"}>],  ## ERROR -  json parse error / invalid - single-line - failed multi-line inscribe
  [111,  %Q<{"p":"orc-721","op":"mint","s":"diypunks","g":[3.4.59]}>],  ## ERROR - numbers with dots
  [112,  %Q<{"p":"orc-721","op":"mint","s":"diypunks","g":[0,59]}>],  ## ERROR
  [113,  %Q<{"p":"orc-721","op":" mint","s":"diypunks","g":[0,59]}>],  ## ERROR
  [114,  %Q<{"p":"orc-721","op":"MINT","s":"diypunks","g":[0,59]}>],  ## ERROR
  [115,  %Q<{"p":" orc-721","op":"mint","s":"diypunks","g":[0,59]}>],  ## ERROR
  [116,  %Q<{"p":"ORC-721","op":"mint","s":"diypunks","g":[0,59]}>],  ## ERROR
  [117,  %Q<{"p":"ORC721","op":"mint","s":"diypunks","g":[0,59]}>],  ## ERROR
  [118,  %Q<{"p":"orc721","op":"mint","s":"diypunks","g":[0,59]}>],  ## ERROR
  [118,  %Q<{"p":"orc-721","op":"mint","s":"diyypunks","g":[0,59]}>],  ## ERROR
  [118,  %Q<{"p":"orc-721","op":"mint","s":"","g":[0,59]}>],  ## ERROR
  [118,  %Q<{"p":"orc-721","op":"mint","s":"_","g":[0,59]}>],  ## ERROR
  [118,  %Q<{"p":"orc-721","op":"mint","s":"DIY","g":[0,59]}>],  ## ERROR
]


## more
##   check for json - key duplicates accepted in json parse e.g
###           "p": "orc-721", "p": "orc-721", ...


deploys ={
  'diypunks' => { 'num' => 10,  ## deploy inscribe num
                  'g'   => 60     ##  max g range e.g. 0-59 (60)
                },
}



mint_inscribes.each do |num, content|
  errors =  validate_mint( num, content, deploys: deploys )
  if errors.size == 0
     puts "OK       - #{num}"
  else
     puts
     puts "!! ERROR - #{num}"
     puts content
     errors.each do |msg|
       puts "   #{msg}"
     end
     puts
  end
end


puts "bye"
