class Pagemanager {

  // The different dilemmas - could be an array, but it was easier to navigate as non-array
  Dilemma bottle;
  Dilemma food;
  Dilemma transport;

  // The two objects as empty non instantialized variables
  Object object1;
  Object object2;

  // Counter to select the screen the program is on.
  int currentScene = 0;

  // Empty arrays which are going to receive the file arrays through the constructor.
  Movie[] listOfMovies;
  PImage[] backgroundImages;
  ArrayList<PImage[]> sprites;

  // :)


  // Constructor for importing the files from the main 
  Pagemanager(Movie[] _listOfMovies, PImage[] _backgroundImages, ArrayList<PImage[]> _sprites) {
    // Initializes the arrays to be the size of the imported arrays
    listOfMovies = new Movie[_listOfMovies.length]; 
    backgroundImages = new PImage[_backgroundImages.length];

    // Uses the arrayCopy to copy the arrays into the new array.
    arrayCopy(_listOfMovies, listOfMovies);
    arrayCopy(_backgroundImages, backgroundImages);
    
    sprites = new ArrayList<PImage[]>(); // Initializes the arrayList
    
    // For copying arrayList, the program has to do another solution
    // The program instead has a for loop goes through, equal the size of the imported arrayList, and adds the elements to the new arrayList.
    for (int i = 0; i < _sprites.size(); i++) {
      sprites.add(_sprites.get(i));
    }
  }

  // A function to instantiate a dilemma by number, so the movie, background and sprite are the same.
  Dilemma instantiate(int dilemmaToInstantiate, String zone) {
    object1 = new Object(sprites.get(dilemmaToInstantiate), width/2, height/2); // The first object gets instantiated
    object2 = new Object(sprites.get(dilemmaToInstantiate), width/2, height/2); // The second object gets instantiated
    // Both objects share the same sprites. That is because the sprites, when there are more than 2 elements, have more than just two images.

    Page page = new Page(listOfMovies[dilemmaToInstantiate], backgroundImages[dilemmaToInstantiate]); // Instantiating the page

    Dilemma instantiatedDilemma = new Dilemma(object1, page, zone); // Instantiating the dilemma with the objects and pages

    // A final function to check if there are one or two objects, which it then uses to instantiate the dilemma again
    if (zone == "MIDDLE") {
      object1 = new Object(sprites.get(dilemmaToInstantiate), width/6, height/2);
      object2 = new Object(sprites.get(dilemmaToInstantiate), (width/6)*5, height/2);
      instantiatedDilemma = new Dilemma(object1, object2, page, zone);
    } else if (zone == "SIDES") {
      instantiatedDilemma = new Dilemma(object1, page, zone);
    }
    return instantiatedDilemma; // returns the instantiatedDilemma.
  }
/*
  void bottleDilemma() {
    bottle.controller();
  }

  void transportDilemma() {
    transport.controller();
  }

  void foodDilemma() {
    food.controller();
  } 
  
  void xxxDilemma() {
   }*/

  // Function to control which page the program is at
  void pageController() {  
    if (currentScene == 0) {
      bottle.controller();
    } else if (currentScene == 1) {
      transport.controller();
    } else if (currentScene == 2) {
      food.controller();
    } else {
      image(backgroundImages[1], width/2, height/2);
    }
  }

  // Checks if the user interacts, using the same counter as above to decide which scene is interacted with.
  // It also counts up when there has been a succesfull interaction, as the function it calls, "interactionWithObject" return either a 0 or a 1.
  void checkIfInteract() {
    if (currentScene == 0) {
      currentScene += bottle.interactionWithObject();
    } else if (currentScene == 1) {
      currentScene += transport.interactionWithObject();
    } else if (currentScene == 2) {
      currentScene += food.interactionWithObject();
    } else {
      println("Debug");
    }
  }
}
