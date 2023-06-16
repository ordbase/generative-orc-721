/////////////////////////////////////////////////
//  core pixel drawing tool machinery
//





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



     $("#grid").on("change", function() {
   if (this.checked) {
       $canvas.addClass("grid");
   } else {
       $canvas.removeClass("grid");
   }
     })




  ////////////////////////////////
  // add random design on startup

  var design = "128 129 130 131 132 133 134 151 159 174\n" +
               "177 178 179 180 181 184 198 200 206 208\n" +
               "222 224 226 227 228 230 232 246 248 250\n" +
               "252 254 256 270 272 274 276 278 280 293\n" +
               "295 297 300 302 304 317 319 321 324 326\n" +
               "328 342 344 346 348 350 352 366 368 370\n" +
               "372 374 376 390 392 394 396 398 400 414\n" +
               "416 418 419 420 422 424 438 440 446 448\n" +
               "462 464 465 466 467 468 469 472 486 488\n" +
               "495 510 512 514 515 516 517 518 534 536\n" +
               "538 558 560 562";
  console.log( "design:", design );
  var a = parseNumbers( design );
  drawCanvas( a );
  $("#out").val( design );

 };   // onload function

