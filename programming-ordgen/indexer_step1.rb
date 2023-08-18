require 'unisat'

## Step 0:  Configure  the file path to your local google chrome browser 
##             required by puppeeter.
CHROME_PATH = 'C:\Program Files\Google\Chrome\Application\chrome.exe'
Unisat::Puppeteer.chrome_path = CHROME_PATH

## Step 1:  
recs = Unisat::Puppeteer.search( 'diyphunks' )  
puts "  #{recs.size} inscribe(s)"
#=> 21 inscribe(s)

pp recs
#=>[{"id"=>"09e3c57879b0a30239b088468277d009f838111d254eb22f35a9b2a31b77a5d4i0",
#    "num"=>"13418851",
#    "date"=>"24.6.2023, 22:41:33",
#    "address"=>"bc1pmgu...quyqrah",
#    "text"=> "og deploy diyphunks↵name: D.I.Y. Phunks↵max: 100↵dim: ..."},
#   {"id"=>"54a448aad17203e322b3d421d91c12e1e4c1b1ca46ef2849e52774aeb7a3bd3bi0",
#    "num"=>"13418907",
#    "date"=>"24.6.2023, 22:45:20",
#    "address"=>"bc1pmgu...quyqrah",
#    "text"=>"og mint diyphunks 5 57 38"},
#    ...]

puts "bye"