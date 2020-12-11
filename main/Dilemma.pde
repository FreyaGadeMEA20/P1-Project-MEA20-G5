class Dilemma {
  Page page;

  Object object1;
  Object object2;

  String zone;

  boolean firstTime = false;

  PImage[] images;

  boolean playMovie = true;
  boolean playInteraction;

  Dilemma(Object _object, Page _page, String _zone) {
    page = _page;
    object1 = _object;
    zone = _zone;
  }

  Dilemma(Object _object1, Object _object2, Page _page, String _zone) {
    page = _page;
    object1 = _object1;
    object2 = _object2;
    zone = _zone;
  }

  // Controller function which controls the flow of the dilemma
  void controller() {
    if (!firstTime) {
      page.myMovie.play();
      firstTime = true;
    }
    if (playMovie) { // If the playMovie boolean is true, it will run the playMovie function.
      playMovie = page.playMovie();
    } else { // Else if it is not true, it will visualize the background image.
      visualizeBackground();

      // It will also display the object for the user, depending on if the zone is the side or the midddle
      if (zone=="SIDES") { // If the click zone is the sides, it will visualize only one object
        visualizeObject(object1, 0);
      } else if (zone == "MIDDLE") {
        visualizeObject(object1, 0);
        visualizeObject(object2, 2);
      }
    }
  }

  void visualizeBackground() {
    page.backgroundImage();
  }

  void visualizeObject(Object object, int order) {
    object.update();
    object.display(order);
  }

  int interactionWithObject() {
    int i = 0;
    if (zone == "MIDDLE") {
      if (object1.clicked) {
        i = interactionZone(mouseX, zone);
      } else if (object2.clicked) {
        i = interactionZone(mouseX, zone);
      }
      object1.mouseFollow();
      object2.mouseFollow();
    } else if (zone == "SIDES") {
      if (object1.clicked) {
        i = interactionZone(mouseX, zone);
      }
      object1.mouseFollow();
    }

    return i;
  }

  int interactionZone(float x, String zone) {
    int i = 0;
    float zoneX = width/2;
    float zoneWidth = width/4;

    if (zone == "MIDDLE") {
      zoneX = width/2;
      // Booleans to check if it hits within the boundaries of the box
      boolean interactionZone1 = x > zoneX - zoneWidth/2;
      boolean interactionZone2 = x < zoneX + zoneWidth/2;

      if (interactionZone1 && interactionZone2 && object1.clicked) { 
        i = 1; // Sets the int that gets returned to 1, so it can continue till the next page
        println("Clicked box with object one"); // Debug print
      } else if (interactionZone1 && interactionZone2 && object2.clicked) {
        i = 1; // Sets the int that gets returned to 1, so it can continue till the next page
        println("clicked box with object two"); // Debug print
      }
      
      
    } else if (zone == "SIDES") {
      zoneX = width/6;

      // Booleans to check if it hits within the boundaries of left side box
      boolean interactionZone1 = x > zoneX - zoneWidth/2;
      boolean interactionZone2 = x < zoneX + zoneWidth/2;

      // Booleans to check if it hits within the boundaries of the right side box
      boolean interactionZone3 = x > (zoneX*5) - zoneWidth/1.5;
      boolean interactionZone4 = x < (zoneX*5) + zoneWidth/1.5;

      if (interactionZone1 && interactionZone2) {
        i = 1; // Sets the int that gets returned to 1, so it can continue till the next page
        println("Clicked left side"); // Debug print
      } else if (interactionZone3 && interactionZone4) {
        i = 1; // Sets the int that gets returned to 1, so it can continue till the next page
        println("Clicked right side"); // Debug print
      }
    }
    return i;
  }
}
