$(document).ready(function() {
  $( "#shortener_form" ).on( "submit", function( event ) {
    event.preventDefault();
    var formData = $( this ).serialize();
    console.log( "dentro de submit... " + formData );
    $.post( "/", formData, function( data ) {
      console.log( "dentro de post... " + data );
      $( "#new_url" ).html( data );
    });
  });
});
