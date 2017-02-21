$(document).ready(function() {
  $( "#answer_form" ).on( "submit", function( event ) {
    // event.preventDefault();
    var formData = $( this ).serialize();
    $.post( "rolls", formData, function( data ) {
      $( "#die" ).html( data );
    });
  });
});