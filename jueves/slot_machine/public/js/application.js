$(document).ready(function() {
  $( "#slotform" ).on( "submit", function( event ) {
    event.preventDefault();
    var formData = $( this ).serialize();
    console.log( "dentro de submit... " + formData );
    $.post( "rolls", formData, function( data ) {
      console.log( data );
      $( "#die" ).html( data );
    });
  });
});
