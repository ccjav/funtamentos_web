$(document).ready(function() {
  $( "#rightWrong" ).on( "submit", function( event ) {
    event.preventDefault();
    var card = $(this).find("#answer_form").attr('data-card')
    var formData = $( this ).find("#answer_form").serialize() + "&card=" + card;
    $.post( "/play", formData, function( data ) {
      $( "#rightWrong" ).html( data );
    });
  });
});