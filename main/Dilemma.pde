class Dilemma {
  Page page;

  Object object;

  PImage[] images;

  boolean playMovie = true;
  boolean playInteraction;

  Dilemma(Object _object, Page _page) {
    page = _page;
    object = _object;
  }

  void controller() {
    if (playMovie) {
      playMovie = page.playMovie();
    } else {
      visualizeBackground();
      visualizeObject();
    }
  }
  
  void generateObject(){
    
  }
  
  void visualizeBackground(){
     page.backgroundImage(); 
     page.objectOnScreen();
  }
  
  void visualizeObject(){
    object.display();
    object.update();
  }
  
  void interactionWithObject(){
    object.mouseFollow();
  }
}
