class Object {
  // Array that holds both the object with and without an outline
  PImage[] objectIMG;

  // Position for its base position, when the object needs to reset
  float x;
  float y;

  // Position for the object
  float newX;
  float newY;

  // Variables for the pulse function
  int max = 255;
  float pulseTransparency = 126;
  float minimumTransparency = 0;
  float maximumTransparency = 255;
  float pulseModifier = 2;

  // Booleans to check if it has reached max
  boolean reachedAlphaMax = false; // Starts at false to make sure it goes up
  boolean reachedAlphaMin = true; // Starts at true so it goes up

  // Booleans to check for the mouse
  boolean mouseCondition1;
  boolean mouseCondition2;
  boolean mouseCondition3;
  boolean mouseCondition4;

  // Booleans for checking if the user hovers or clicks the object
  boolean mouseOnObject;
  boolean clicked;

  // Constructor for the class, which takes in which image it needs to show, as well as the positon of the object.
  Object(PImage[] _objectIMG, float _x, float _y) {
    objectIMG = _objectIMG;
    x = _x;
    y = _y;
  }

  // Displays the object. The integer "order" is used for when there are multiple objects needed to be shown.
  void display(int order) {
    tint(max, pulseTransparency); // Tint for the pulsing image
    image(objectIMG[order+1], newX, newY); // Drawing the pulsing image

    tint(max, max); // Resetting the tint, as only one has to pulse
    image(objectIMG[order], newX, newY); // Drawing the non pulsing image.
  }

  // Updating the object - position and pulse.
  void update() {
    if (!clicked) { // Runs this part of the code if the boolean variable clicked is false
      newX = x; // Positions in based on the value of x and y
      newY = y;
      // Pulse max and min checker
      if (pulseTransparency >= maximumTransparency) { // If it has reached the max:
        reachedAlphaMax = true; // set the reached max variable to true
        reachedAlphaMin = false; // set the reached min variable to false
      } else if (pulseTransparency <= minimumTransparency) { // Else if it has reached min:
        reachedAlphaMax = false; // set the reached max variable to false
        reachedAlphaMin = true; // set the reached min variable to true
      } 

      // Changing the transparency variable
      if (reachedAlphaMin) { // If it has reached the minimum value:
        pulseTransparency = pulseTransparency + pulseModifier; // make the value bigger
      } else if (reachedAlphaMax) { // Else if it has reached the maximum value:
        pulseTransparency = pulseTransparency - pulseModifier; // make the value smaller
      }
    } else if (clicked) { // Runs this part of the code if the boolean variable is true
      pulseTransparency = 0; // Sets the transparency to 0, so it only shows the one without the border
      newX = mouseX; // Sets the position to be based on the value of the mouse position
      newY = mouseY;
    } 

    // Booleans to check if the mouse is within the area of the object.
    mouseCondition1 = mouseX > newX - objectIMG[0].width/2;
    mouseCondition2 = mouseX < newX + objectIMG[0].width/2;
    mouseCondition3 = mouseY < newY + objectIMG[0].height/2;
    mouseCondition4 = mouseY > newY - objectIMG[0].height/2;

    // If the mouse is on the object, it will set the boolean mouseOnObject to true
    if (mouseCondition1 && mouseCondition2 && mouseCondition3 && mouseCondition4) {
      mouseOnObject = true;
    } else { // Else it will be false.
      mouseOnObject = false;
    }
  }

  // Mouse follow function
  void mouseFollow() {
    // Runs the function only if the boolean mouseOnObject is true
    if (mouseOnObject) {
      if (clicked) { // It then checks if the clicked is true or not, to decide if it should pick it up or drop it
        clicked = false;
      } else {
        clicked = true;
      }
    }
  }
}
