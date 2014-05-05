         var loadedTilesCounter;
         var currentTileTimeoutMs;

         function updateProgressBar() {
           var progressBarWidth = Math.round(loadedTilesCounter/10);
	   document.getElementById("progressBar").style.width = progressBarWidth + "px";
         }

         function updateDisplay() {
	    document.getElementById("owlContainer").style.display = "block";
	    document.getElementById("loadingArea").style.display = "none";
	    document.getElementById("progressBarFrame").style.display = "none";
         }

         function displayProgress() {
           loadedTilesCounter++;
           updateProgressBar();           

           if (loadedTilesCounter == 2556) {
               updateDisplay();
           }
           
         }

         function tileTimeoutMaintenance() {
             if (currentTileTimeoutMs < 60000) {
               currentTileTimeoutMs += 1000;
	       setTimeout("tileTimeoutMaintenance()", 5000);
             }
         }

         function owl(idsToChange) {
           for (i in idsToChange) {           
	      var surroundingElement = document.getElementById(idsToChange[i]); 
              if (surroundingElement != null) {
                document.getElementById(idsToChange[i]).src = "owl/" + idsToChange[i] + ".jpg"; 
              }
           }
         }

         function surroundingIds(id) {
            var coordinates = new Array();
            coordinates = id.split("_");
            var x_coordinate = parseInt(coordinates[0]);
            var y_coordinate = parseInt(coordinates[1]);
            
            var ids = new Array(4);
            ids[0] = x_coordinate+10 + "_" + (y_coordinate+10);
            ids[1] = x_coordinate+10 + "_" + (y_coordinate-10);
            ids[2] = x_coordinate-10 + "_" + (y_coordinate+10);
            ids[3] = x_coordinate-10 + "_" + (y_coordinate-10);
            return ids;
         }

         function pellet() {
            var idsToChange = surroundingIds(this.id);
            for (i in idsToChange) {
	      var surroundingElement = document.getElementById(idsToChange[i]); 
              if (surroundingElement != null) {
                surroundingElement.src = "pellet/" + idsToChange[i] + ".jpg";
              }
              var idsToPass = idsToChange;
	      setTimeout(function() {owl(idsToPass);}, currentTileTimeoutMs);
            }
         }

         function owlTiles() {
            loadedTilesCounter = 0;
            currentTileTimeoutMs = 4000;            

            updateProgressBar();

	    tileTimeoutMaintenance();

            for (y_offset=0; y_offset<710; y_offset=y_offset+10) {

              for (x_offset=0; x_offset<360; x_offset=x_offset+10) {

		var tile = document.createElement("img");
                tile.onload = displayProgress;
                tile.onmouseover = pellet;
                tile.id = x_offset + "_" + y_offset;
                tile.style.width = "10px";
                tile.style.height = "10px";
                document.getElementById("owlContainer").appendChild(tile);
                tile.src = "owl/" + x_offset + "_" + y_offset + ".jpg";

              } 

            }

         }
