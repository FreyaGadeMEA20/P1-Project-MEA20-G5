class Dilemma {
  Page page;

  Object object1;
  Object object2;

  String zone;

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

  void controller() {
    if (playMovie) {
      playMovie = page.playMovie();
    } else {
      visualizeBackground();
      //visualizeObject();
    }
  }

  void visualizeBackground() {
    page.backgroundImage();
  }

  void visualizeObject(Object object) {
    object.update();
    object.display();
  }

  void interactionWithObject() {
    if (zone == "MIDDLE") {
      if (object1.clicked) {
        interactionZone(mouseX, zone);
      } else if (object2.clicked) {
        interactionZone(mouseX, zone);
      }
      object1.mouseFollow();
      object2.mouseFollow();
    } else if (zone == "SIDES") {
      if (object1.clicked) {
        interactionZone(mouseX, zone);
      }
      object1.mouseFollow();
    }
  }

  void interactionZone(float x, String zone) {
    float zoneX = width/2;
    float zoneWidth = width/4;

    if (zone == "MIDDLE") {
      zoneX = width/2;
      // Booleans to check if it hits within the boundaries of the box
      boolean interactionZone1 = x > zoneX - zoneWidth/2;
      boolean interactionZone2 = x < zoneX + zoneWidth/2;

      if (interactionZone1 && interactionZone2 && object1.clicked) { 
        println("Clicked box with object one");
      } else if (interactionZone1 && interactionZone2 && object2.clicked) {
        println("clicked box with object two");
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
        println("Clicked left side");
      } else if (interactionZone3 && interactionZone4) {
        println("Clicked right side");
      }
    }
  }
}
