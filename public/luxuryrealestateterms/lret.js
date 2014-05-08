
var num_adjectives = 53;
var num_nouns = 27;
var adjImages;
var nounImages;

function random(upper, lower) {
    return Math.floor((Math.random() * (upper-lower+1))+lower);
}

function preloader(n, folder, images) {
    for (j=1;j<=n;j++) {
        images[j-1] = new Image();
        images[j-1].src = "luxuryrealestateterms/" + folder + "/" + j + ".jpg";
    }
}

function changeTerm(id, folder) {    
    var imageId;
    if (folder == "adjectives") {
      imageId = random(1, num_adjectives);
    } else {
      imageId = random(1, num_nouns);
    }
    var imageSrc = "luxuryrealestateterms/" + folder + "/" + imageId + ".jpg";
    document.getElementById(id).style.backgroundImage = "url(" + imageSrc + ")";
}

function actuallyChangeTerm(id, folder) {
    changeTerm(id, folder);
    prepTimeout(id, folder);
}

function prepTimeout(id, folder) {
    var termTimeout = random(5000, 8000);
    setTimeout(function() {actuallyChangeTerm(id, folder);}, termTimeout);
}

function luxury() {
    changeTerm("adjectiveOne", "adjectives");
    changeTerm("adjectiveTwo", "adjectives");
    changeTerm("noun", "nouns");

    adjImages = new Array(num_adjectives);
    nounImages = new Array(num_nouns);

    preloader(num_adjectives, "adjectives", adjImages);
    preloader(num_nouns, "nouns", nounImages);

    prepTimeout("adjectiveOne", "adjectives");
    prepTimeout("adjectiveTwo", "adjectives");
    prepTimeout("noun", "nouns");
}
