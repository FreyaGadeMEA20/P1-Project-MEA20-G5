class Pagemanager {
  //Dilemma[] arrayOfPages;
  Dilemma bottle;
  Dilemma food;
  Dilemma transport;

  Object object1;
  Object object2;

  int currentScene = 0;

  Movie[] listOfMovies;
  PImage[] backgroundImages;
  ArrayList<PImage[]> sprites;

  // :)

  Pagemanager(Movie[] _listOfMovies, PImage[] _backgroundImages, ArrayList<PImage[]> _sprites) {
    listOfMovies = new Movie[_listOfMovies.length];
    backgroundImages = new PImage[_backgroundImages.length];

    arrayCopy(_listOfMovies, listOfMovies);
    arrayCopy(_backgroundImages, backgroundImages);
    
    sprites = new ArrayList<PImage[]>();
    for (int i = 0; i < _sprites.size(); i++) {
      sprites.add(_sprites.get(i));
    }
  }

  Dilemma instantiate(int dilemmaToInstantiate, String zone) {
    object1 = new Object(sprites.get(dilemmaToInstantiate), width/2, height/2);
    object2 = new Object(sprites.get(dilemmaToInstantiate), width/2, height/2);

    Page page = new Page(listOfMovies[dilemmaToInstantiate], backgroundImages[dilemmaToInstantiate]);

    Dilemma instantiatedDilemma = new Dilemma(object1, page, zone);

    if (zone == "MIDDLE") {
      object1 = new Object(sprites.get(dilemmaToInstantiate), width/6, height/2);
      object2 = new Object(sprites.get(dilemmaToInstantiate), (width/6)*5, height/2);
      instantiatedDilemma = new Dilemma(object1, object2, page, zone);
    } else if (zone == "SIDES") {
      instantiatedDilemma = new Dilemma(object1, page, zone);
    }
    return instantiatedDilemma;
  }

  void bottleDilemma() {
    bottle.controller();
  }

  void transportDilemma() {
    transport.controller();
  }

  void foodDilemma() {
    food.controller();
  }

  /*void xxxDilemma() {
   }*/

  // Function to control which page the program is at
  void pageController() {
    if (currentScene == 0) {
      bottle.controller();
    } else if (currentScene == 1) {
      transport.controller();
    } else if (currentScene == 2) {
      food.controller();
    }
  }

  void checkIfInteract() {
    if (currentScene == 0) {
      currentScene += bottle.interactionWithObject();
    } else if (currentScene == 1) {
      currentScene += transport.interactionWithObject();
    } else if (currentScene == 2) {
      currentScene += food.interactionWithObject();
    } else {
      println("Oh oh");
    }
  }
}
