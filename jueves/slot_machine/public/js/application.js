$(document).ready(function() {
  $("#submit").click(function(){
        $.post("rolls");
        console.log( "You clicked a paragraph!" );
    });
});