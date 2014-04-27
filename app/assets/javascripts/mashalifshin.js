$(document).ready(function() {

	var NUMBER_OF_SYMBOLS = 100

	for (i=0; i<NUMBER_OF_SYMBOLS; i++) {
		var new_span = newRandomElement();
		$('#header_visual').append(new_span.fadeOut(200, function() { $(this).remove() }));
	}

	function newRandomElement() {
		var color_r = randomIntInRange(0,256);
		var color_g = randomIntInRange(0,256);
		var color_b = randomIntInRange(0,256);
		var color_a = parseFloat(randomIntInRange(0,100) / 100);
		var size = randomIntInRange(200,500);
		var unicde_character_basic_multilingual_plane = randomIntInRange(8192, 11093);
		return new_div = $("<span style='color: rgba(" + color_r + "," + color_g + ", " + color_b + ", " + color_a + "); " +
																"font-size: " + size + "px;'> " +
																"&#" + unicde_character_basic_multilingual_plane + ";</span>");

	}

	function randomIntInRange(min, max) {
    return Math.floor(Math.random()*(max-min+1)+min);
	}

});