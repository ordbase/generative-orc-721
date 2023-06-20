///////////////////////////////////////////
//   support functions for parsing and generating pixel matrix


 function initArray(w, h) {
  var imageArray = [];
  for (var y = 0; y < h; y++) {
      var row = [];
      imageArray.push(row);
      for (var x = 0; x < w; x++) {
           row.push(0);
      }
  }
  return imageArray;
    }


     function generateNumbers( ary ) {
          let w = 24;
          let h = 24;
         let nums = [];


         for (let y = 0; y < h; y++) {
             let row = ary[y];
            for (let x = 0; x < w; x++) {
               let color = row[x];
             if( color != 0 ) {
                nums.push((y*w+x) );
             }
          }
          console.log( nums );
        }
          // convert to string

           let str = nums.map( (num) => ""+num ).join(", ");
        return str;

    }





     //////////////
     // pixelart number format
     //   support comments starting with #
     //         and allow empty lines
     //    support leading trailing spaces (get auto-trimmed)
     //    auto-trim leading and trailing whitespaces & emptylines in design
     //

     function parseNumbers( str ) {
        let w = 24;
        let h = 24;
        let nums = [];

       str.trim().split( "\n" ).forEach( line => {
            line = line.trim();
            if( line.startsWith( "#" ) || line.length == 0 ) {
              // do nothing; skip
            } else {
              line.split( /[ \t,]+/ ).map( x =>
                                    nums.push( parseInt( x, 10)) );
            }
          } );

          console.log( "nums:", nums );

          let ary = initArray( w, h );
          let max =  w*h;
          nums.map( num => {
            // check for overflow
            // warn but do NOT crash for now
            if( num < max ) {
              let x = num % w;
              let y = Math.floor(num / w);
              ary[y][x] = 1;
            } else {
              console.log( "warn - number out-of-bitmap range", num, max );
            }
          });

       return ary;
    }


