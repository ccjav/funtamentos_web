$(window).on("scroll", function () {
  	// Aquí deberás escribir la lógica que modificará la barra
	if ($(document).scrollTop() > 65) {
		$(".top-nav").addClass("opacize");
	} else {
		$(".top-nav").removeClass("opacize");
	}
});
