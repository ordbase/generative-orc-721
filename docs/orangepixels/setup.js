/////////////////////////////////////////////////
//  core pixel drawing tool machinery
//


function randomInt(max) {
  return Math.floor(Math.random() * max);
}
// console.log(randomInt(3));
// expected output: 0, 1 or 2


var designs = designs_starter.concat( designs_punks );


function mapAsciiToColor( x, chars ) {
  let pos = chars.indexOf( x );
  if( pos == -1 ) {
     // assume number (as string) - convert to number
     return parseInt( x, 10 );
  }
  else {
    return pos;
  }
}

function parseAscii( str, chars ) {
  let ary = [];
  str.trim().split( "\n" ).forEach( line => {
       line = line.trim();
       if( line.startsWith( "#" ) || line.length == 0 ) {
         // do nothing; skip
       } else {
         values = line.split( /[ \t]+/ ).map( x => mapAsciiToColor( x, chars ));
         ary.push( values );
       }
     } );
  return ary;
}

 function designToNumbers( str ) {
   // note: for now assume 24x24 px
   let ary = parseAscii( str, ".@" );

   return generateNumbers( ary );
 }


 function randomDesign() {
   let design = designs[ randomInt( designs.length) ];
   // note: auto-trim - leading and trailing empty lines & whitespaces
   return designToNumbers(  design.trim() );
 }






 window.onload=()=>{
     var $canvas = $("#canvas");
     var emptyColor = "#ffffff"



     function getActiveColorId() { return 1;  }


     function getColorCode(colorId) {
         if (!colorId || colorId === 0) {
           return "#ffffff";
         } else {
            // todo/fix: report error if color id is NOT 1
            // only one foreground color supported for now
           return "#ff9900";
        }
     }


function drawCanvas(array) {
   $canvas.html('')
   array.forEach(function(subArray, i) {
       var $row = $("<div class='row'></div>").appendTo($canvas);
       subArray.forEach(function(cell, j) {
     var color = getColorCode(cell)
     var $cell = $("<div class='cell' style='background-color:" + color + "'></div>").appendTo($row)
     $cell.on("mousedown", function(e) {
         var colorId = getActiveColorId();
         var colorCode = getColorCode( colorId );
         if (e.which === 1 && array[i][j] != colorId) {
       array[i][j] = colorId;
       $cell.css("background-color", colorCode);
         } else {
       array[i][j] = 0
       $cell.css("background-color", emptyColor);
         }
     });
     $cell.on("mouseenter", function(e) {
         var colorId = getActiveColorId();
         var colorCode = getColorCode(colorId);
         if (e.which === 1) {
       array[i][j] = colorId;
       $cell.css("background-color", colorCode)
         }
         if (e.which === 3) {
       array[i][j] = 0;
       $cell.css("background-color", emptyColor);
         }
         e.preventDefault();
         e.stopPropagation();
     })
       })
   })
     }
     var a = initArray(24, 24);
     drawCanvas(a);
     $(".color").each(function() {
   var $input = $(this);
   $input.css("background-color", "#" + $input.val());
   $input.on("change keyup", function() {
       $input.css("background-color", "#" + $input.val());
   })
     })

     $("#reset").on("click", function() {
   a = initArray( 24, 24);
   drawCanvas(a);
     })



     $("#print").on("click", function() {
   var str = generateNumbers( a );
   console.log( str );
   $("#out").val( str );
     })

     $("#read").on("click", function() {
   var str = $("#out").val();
   a = parseNumbers( str );
   drawCanvas(a);
   console.log(a);
     })



     $("#redraw").on("click", function() {
   drawCanvas(a);
     })

     $("#design").on("click", function() {
      var design = randomDesign();
      a = parseNumbers( design );
      drawCanvas( a );
      $("#out").val( design );
     })


     $("#grid").on("change", function() {
   if (this.checked) {
       $canvas.addClass("grid");
   } else {
       $canvas.removeClass("grid");
   }
     })




  ////////////////////////////////
  // add random design on startup

  var design = randomDesign();
  console.log( "design:", design );
  var a = parseNumbers( design );

  drawCanvas( a );
  $("#out").val( design );

 };   // onload function

