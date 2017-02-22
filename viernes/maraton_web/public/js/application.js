$(document).ready(function() {
  $( "#answer_form" ).on( "submit", function( event ) {
    event.preventDefault();
    // console.log( $(this).attr('data-deck') );
    var card = $(this).attr('data-card')
    var formData = $( this ).serialize() + "&card=" + card;
    $.post( "/play", formData, function( data ) {
      console.log( data )
      $( "#rightWrong" ).html( data );
    });
  });
});