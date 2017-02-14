$(document).ready(function () {
  //muestra inicialmente la primera tab
  $('#tab1').removeClass("tab")
  $('.tabs').find('a').on('click', function(e){
    // evita que en la barra de navegación se muestre la direccón de la tab
    e.preventDefault();
    // al hacer click, quita la clase tab (que tiene display: none) al elemento con el id igual al href # (hash)
    $(this.hash).removeClass("tab")
    // array de los elementos que NO fueron clickeados
    var brothers = $(this).parent().siblings().find('a')
    // itera sobre array y a cada elemento con mismo id que'l href le agrega la clase tab (display: none)
    $.each(brothers, function(index, value) {
      $(value.hash).addClass("tab")
    });
    // agrega clase active al li clickeado y se la quita a sus hermanos
    $(this).parent().addClass("active").siblings().removeClass("active")
  });
});

