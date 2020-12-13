class Pagemanager {

  // The different dilemmas - could be an array, but it was easier to navigate as non-array
  Dilemma bottle;
  Dilemma food;
  Dilemma transport;
  Dilemma shopping;
  Dilemma gaming;
  Dilemma work;
  Dilemma finalScene;

  // The two objects as empty non instantialized variables
  Object object1;
  Object object2;
  Page page;

  // Counter to select the screen the program is on.
  int currentScene = 0;
  int goodEnding = 0;

  // Empty arrays which are going to receive the file arrays through the constructor.
  Movie[] listOfMovies;
  PImage[] backgroundImages;
  ArrayList<PImage[]> sprites;
  ArrayList<SoundFile[]> soundEffects;

  // :)


  // Constructor for importing the files from the main 
  Pagemanager(Movie[] _listOfMovies, PImage[] _backgroundImages, ArrayList<PImage[]> _sprites, ArrayList<SoundFile[]> _soundEffects) {
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

    // SAME AS ABOVE //
    soundEffects = new ArrayList<SoundFile[]>();

    for (int i = 0; i < _soundEffects.size(); i++) {
      soundEffects.add(_soundEffects.get(i));
    }
  }

  // A function to instantiate a dilemma by number, so the movie, background and sprite are the same.
  Dilemma instantiate(int dilemmaToInstantiate, String zone, String choice) {
    if (zone != "FINAL") {
      object1 = new Object(sprites.get(dilemmaToInstantiate), width/2, height/2); // The first object gets instantiated
      object2 = new Object(sprites.get(dilemmaToInstantiate), width/2, height/2); // The second object gets instantiated
      // Both objects share the same sprites. That is because the sprites, when there are more than 2 elements, have more than just two images.

      page = new Page(listOfMovies[dilemmaToInstantiate], backgroundImages[dilemmaToInstantiate], soundEffects.get(dilemmaToInstantiate), choice); // Instantiating the page
    }
    Dilemma instantiatedDilemma = new Dilemma(object1, page, zone); // Instantiating the dilemma with the objects and pages
    // A final function to check if there are one or two objects, which it then uses to instantiate the dilemma again
    if (zone == "MIDDLE") {
      object1 = new Object(sprites.get(dilemmaToInstantiate), width/6, height/2);
      object2 = new Object(sprites.get(dilemmaToInstantiate), (width/6)*5, height/2);
      instantiatedDilemma = new Dilemma(object1, object2, page, zone);
    } else if (zone == "SIDES") {
      instantiatedDilemma = new Dilemma(object1, page, zone);
    } else if (zone == "FINAL") {
      page = new Page(listOfMovies[dilemmaToInstantiate]);
      instantiatedDilemma = new Dilemma(page);
    }
    return instantiatedDilemma; // returns the instantiatedDilemma.
  }

  // Function to control which page the program is at
  void pageController() {  
    if (currentScene == 0) {
      bottle.controller();
    } else if (currentScene == 1) {
      transport.controller();
    } else if (currentScene == 2) {
      work.controller();
    } else if (currentScene == 3) {
      shopping.controller();
    } else if (currentScene == 4) {
      food.controller();
    } else if (currentScene == 5) {
      gaming.controller();
    } else {
      if (goodEnding > currentScene/2) {
      finalScene.finalVideo();
      } else if (goodEnding < currentScene/2) {
      tint(30,255);
      finalScene.finalVideo();
      }
    }
  }

  // Checks if the user interacts, using the same counter as above to decide which scene is interacted with.
  // It also counts up when there has been a succesfull interaction, as the function it calls, "interactionWithObject" return either a 0 or a 1.
  void checkIfInteract() {
    if (currentScene == 0) {
      interact(bottle);
    } else if (currentScene == 1) {
      interact(transport);
      /*int[] controlInt = transport.interactionWithObject();
       currentScene += controlInt[0];
       goodEnding += controlInt[1];*/
    } else if (currentScene == 2) {
      interact(work);
    } else if (currentScene == 3) {
      interact(shopping);
    } else if (currentScene == 4) {
      interact(food);
    } else if (currentScene == 5) {
      interact(gaming);
    } else {
      println("DEBUG");
    }
  }

  void interact(Dilemma dilemma) {
    int[] controlInt = dilemma.interactionWithObject();
    currentScene += controlInt[0];
    goodEnding += controlInt[1];
  }
}
