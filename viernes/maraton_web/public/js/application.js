$(document).ready(function() {
  $( "#rightWrong" ).on( "submit", function( event ) {
    event.preventDefault();
    // console.log( $(this).attr('data-card') + "hola2");
    console.log( $(this).find("#answer_form").attr('data-card') );
    var card = $(this).find("#answer_form").attr('data-card')
    var formData = $( this ).find("#answer_form").serialize() + "&card=" + card;
    $.post( "/play", formData, function( data ) {
      console.log( data )
      $( "#rightWrong" ).html( data );
    });
  });
});