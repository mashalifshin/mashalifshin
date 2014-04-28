$(document).ready(function() {

	var NUMBER_OF_SYMBOLS = 20;

	for (i=0; i<NUMBER_OF_SYMBOLS; i++) {
		var new_span = newRandomElement();
		$('#header_visual').append(new_span);
	}

	function newRandomElement() {
		var color_r = randomIntInRange(0,256);
		var color_g = randomIntInRange(0,256);
		var color_b = randomIntInRange(0,256);
		var color_a = parseFloat(randomIntInRange(0,100) / 100);
		var size = randomIntInRange(1,250);
		var unicde_character_fun_range = randomIntInRange(8192, 11093);
		return new_div = $("<span style='color: rgba(" + color_r + "," + color_g + ", " + color_b + ", " + color_a + "); " +
																"font-size: " + size + "px;'> " +
																"&#" + unicde_character_fun_range + ";</span>");

	}

	function randomIntInRange(min, max) {
    return Math.floor(Math.random()*(max-min+1)+min);
	}

});