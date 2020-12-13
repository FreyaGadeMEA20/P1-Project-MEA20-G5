class Dilemma {
  // Variables for the classes used.
  Page page; 
  Object object1;
  Object object2;

  // Variables important for the clickable zone
  String zone;
  float zoneX = width/2;
  float zoneWidth = width/3;
  float zoneY = height/2;
  float zoneHeight = height;

  // Used to only run the movie once, when it is called upon to avoid overlapping movies.
  boolean firstTime = false;

  // Boolean to check if the movie is playing or not
  boolean playMovie = true;

  // Constructor for one object
  Dilemma(Object _object, Page _page, String _zone) {
    page = _page; // Takes the initialized page from when the class is initialized
    object1 = _object; // Takes the initialized object from when the class is initialized
    zone = _zone; // Takes the zone from when it is initialized
  }

  // Constructor for two objects. Same as above, just with another object.
  Dilemma(Object _object1, Object _object2, Page _page, String _zone) {
    page = _page; 
    object1 = _object1;
    object2 = _object2;
    zone = _zone;
  }

  // Constructor for the final video. Makes it easier.
  Dilemma(Page _page) {
    page = _page;
  }

  // Controller function which controls the flow of the dilemma
  void controller() {
    // As it only needs to run the movie once, and not have every movie run at once, this function is needed to make sure of that.
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
      } else if (zone == "MIDDLE") { // while if the zone is the middle, it will visualize both of the objects.
        visualizeObject(object1, 0);
        visualizeObject(object2, 2);
      }
    }
  }

  // Function is the same as the first part of controller, but only plays the video.
  void finalVideo() {
    if (!firstTime) {
      page.myMovie.play();
      firstTime = true;
    }
    page.playMovie();
  }

  // Calls on the backgroundImage function from the page class
  void visualizeBackground() {
    page.backgroundImage();
  }

  // Visualizes the given object. The int order is for when there are multiple images in the array, used for more than one object.
  void visualizeObject(Object object, int order) {
    object.update(); // runs the update function before the display, to make sure nothing is delayed 
    object.display(order);
    if (object.clicked) { // Function to display the area that can be interacted with. Only shows when the bottle is clicked, as that is when the area is interactable.
      visualizeArea();
    }
  }

  // Function for visualizing area that the user can click on.
  void visualizeArea() {
    fill(#ffff00, 50); // Giving it a transparent yellow color
    float zoneXX; 
    noStroke();
    rectMode(CENTER); 

    // If the zone is the middle zone it draws a rectangle equal to the clickable area.
    if (zone == "MIDDLE") {
      zoneXX = width/2;
      rect(zoneXX, zoneY, zoneWidth, zoneHeight);

      // If the zone is the side zone, it draws both of the clickable areas.
    } else if (zone == "SIDES") {
      zoneXX = width/6;
      rect(zoneXX, zoneY, zoneWidth, zoneHeight);
      rect(zoneXX*5, zoneY, zoneWidth, zoneHeight);
    } else {
      print("no zone"); // Debug print.
    }
  }

  // Function for interaction with the object.
  int[] interactionWithObject() {
    // As it needs to return an integer back, we initialize i as 0, so it has something to return.
    int[] i = {0, 0};
    // Sets the x variable to the value of mouseX
    int x = mouseX;
    // Checks if the zone of the dilemma is in the middle or the side
    if (zone == "MIDDLE") {
      // If it is in the middle, it will focus on checking which object that has been picked up.
      if (object1.clicked) {
        i = interactionZone(x);
      } else if (object2.clicked) {
        i = interactionZone(x);
      }
      object1.mouseFollow();
      object2.mouseFollow();
      // Runs the mouseFollow function on both objects, to reset them.

      // if the zone is the sides, it will run the same as above, but only with one object.
    } else if (zone == "SIDES") {
      if (object1.clicked) {
        i = interactionZone(x);
      } else if (object1.mouseOnObject) {
        page.playSound(0);
      }
      object1.mouseFollow();
    }

    println(i);
    // Then it returns the integer i back, which is either 0 or 1, depending on if the object has been interacted with a zone.
    return i;
  }

  // Function for checking if the object has been dropped in a zone or not.
  int[] interactionZone(float x) {
    // Same as the above function with the integer variable.
    int[] i = {0, 0};

    // If the zone is in the middle, it will run this part of the code.
    if (zone == "MIDDLE") {
      zoneX = width/2; // Sets the x  of the zone to be in the middle
      // Booleans to check if it hits within the boundaries of the box
      boolean interactionZone1 = x > zoneX - zoneWidth/2;
      boolean interactionZone2 = x < zoneX + zoneWidth/2;

      // If the mouse is within the area of the zone and it is the first object that has been clicked, this part of the code will run.
      if (interactionZone1 && interactionZone2 && object1.clicked) { 
        i[0] = 1; // Sets the int that gets returned to 1, so it can continue till the next page
        page.playSound(0);
        i[1] = checkIfGood("LEFT");
        println("Clicked box with object one"); // Debug print

        // If it is instead the other object, object2, this part of the code will run instead.
      } else if (interactionZone1 && interactionZone2 && object2.clicked) {
        i[0] = 1; // Sets the int that gets returned to 1, so it can continue till the next page
        page.playSound(0);
        i[1] = checkIfGood("RIGHT");
        println("clicked box with object two"); // Debug print
      }

      // If the zone is set to the sides, it will run this part of the code.
    } else if (zone == "SIDES") {
      zoneX = width/6; // Sets the x of the zone to be on the left side

      // Booleans to check if it hits within the boundaries of left side box
      boolean interactionZone1 = x > zoneX - zoneWidth/2;
      boolean interactionZone2 = x < zoneX + zoneWidth/2;

      // Booleans to check if it hits within the boundaries of the right side box
      boolean interactionZone3 = x > (zoneX*5) - zoneWidth/2;
      boolean interactionZone4 = x < (zoneX*5) + zoneWidth/2;

      // Checking which zone, left or right, that is interacted with
      if (interactionZone1 && interactionZone2) {
        i[0] = 1; // Sets the int that gets returned to 1, so it can continue till the next page
        i[1] = checkIfGood("LEFT");
        println("Clicked left side"); // Debug print
      } else if (interactionZone3 && interactionZone4) {
        i[0] = 1; // Sets the int that gets returned to 1, so it can continue till the next page
        i[1] = checkIfGood("RIGHT");
        println("Clicked right side"); // Debug print
      }
    }
    return i; // returns 0 or 1, depending on if a zone has been interacted with or not.
  }

  int checkIfGood(String choice) {
    int i = 0;

    if (page.choice == choice) {
      i = 1;
    }

    return i;
  }
}
