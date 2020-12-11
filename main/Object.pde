class Object {
  PImage[] objectIMG;

  float x;
  float y;
  float newX;
  float newY;

  int max = 255;
  float pulseTransparency = 126;
  float minimumTransparency = 0;
  float maximumTransparency = 255;
  float pulseModifier = 2;
  // Booleans to check if it has reached max
  boolean reachedAlphaMax = false; // Starts at false to make sure it goes up
  boolean reachedAlphaMin = true; // Starts at true so it goes up

  boolean mouseCondition1;
  boolean mouseCondition2;
  boolean mouseCondition3;
  boolean mouseCondition4;

  boolean mouseOnObject;
  boolean clicked;

  Object(PImage[] _objectIMG, float _x, float _y) {
    objectIMG = _objectIMG;
    x = _x;
    y = _y;
    newX = x;
    newY = y;
  }

  void display(int order) {
    tint(max, pulseTransparency);
    image(objectIMG[order+1], newX, newY);   

    tint(max, max);
    image(objectIMG[order], newX, newY);
  }

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
