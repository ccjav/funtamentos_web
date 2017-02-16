$(document).ready(function() {
  $( "#grandmaform" ).on( "submit", function( event ) {
    event.preventDefault();
    var formData = $( this ).serialize();
    console.log( "dentro de submit... " + formData );
    $.post( "abuelita", formData, function( data ) {
      console.log( data );
      $( "#answer" ).html( data );
    });
  });
});
