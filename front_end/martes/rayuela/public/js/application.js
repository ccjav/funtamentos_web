$(document).ready(function() {

  for(var i = 0; i < 100; i++) {
    $("tr").append("<td></td>");
  }

  var cells = $('#Player2 td');
  var cells_length = cells.length


  function rayuela(index, interval){
    var cell = cells.eq(index%cells_length);
    console.log(cell);
    if (cell.is('.active')) {
      cell.removeClass('active');
    } else {
      cell.addClass('active');
      cell.prev().removeClass('active')
    }
    var res = null;
    myVar = setTimeout(function(){
      rayuela(++index, interval);
      // console.log(index);
      // if (index >= 85) {
      //   console.log("ochenta y cinco!!");
      // }
    }, interval)

    // $('#parent .child').click(function() {
    //     var index = $(this).index();
    // });
    if(cell.is(':last-child')) {
      clearTimeout(myVar);
    }
    // console.log($('#Player2 .active').index());
    // $( document ).keyup(function(e) {
    //   if (e.key == "d") {
    //     console.log(e);
    //     clearTimeout(myVar);
    //     console.log(index);
    //   }
    // });
  }

  rayuela(0, 45);

  function myStopFunction() {
    $( document ).keyup(function(e) {
      if (e.key == "d") {
        console.log(e);
        clearTimeout(myVar);
        console.log($('#Player2 .active').index());
      }
    });
  }
  // console.log(res);

  myStopFunction();


  // var needStop = false;

// var buttons = $('.button'),
//     buttons_length = buttons.length;

// function sliiide(index, interval){
//     var button = buttons.eq(index%buttons_length);
//     if(button.css('background-color') == 'rgb(0, 0, 255)'){ //blue
//         button.css({
//             background: 'white'
//         });
//     }
//     else {
//         button.css({
//             background: 'blue'
//         });
//     }

//     setTimeout(function(){
//         sliiide(++index, interval);
//     }, interval)
// }


// sliiide(0, 500);

  // console.log(needStop)
  // function yea(){
  //   needStop = true;
  // }
    // $("#Player2 td").each(function(){
    //   var el=$(this);
    //   setInterval(function(i) {
    //     if ($(el).next().length) {
    //       el.removeClass("active").next().addClass("active");
    //     }
    //   }, 50);
    // });
  // function throw_coin(player) {
  //   $("#" + player + " td" ).each(function(i) {
  //     var el=$(this);
  //     myVar = setTimeout(function() {
  //       if ($(el).next().length) {
  //         el.removeClass("active").next().addClass("active");
  //       }
  //     }, i * 50);
  //     $( document ).keyup(function(e) {
  //       if (e.key == "d") {
  //         console.log(e);
  //         needStop = true;

  //       }
  //     });
  //     console.log(needStop)
  //     if (needStop == true) {
  //       return false;
  //     }
  //   });
  // }
  // throw_coin("Player2");
  // function myStopFunction() {

  // }
  // myStopFunction();
//   var myVar = setInterval(function(){ myTimer() }, 1000);

// function myTimer() {
//     var d = new Date();
//     var t = d.toLocaleTimeString();
//     document.getElementById("demo").innerHTML = t;
// }

// function myStopFunction() {
//     clearInterval(myVar);
// }

});








