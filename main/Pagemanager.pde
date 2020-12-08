class Pagemanager {
  //Dilemma[] arrayOfPages;
  Dilemma bottle;
  Dilemma food;
  Dilemma transport;
  
  Object object1;
  Object object2;

  int bottleDilemmaInt = 0;


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
    bottle.visualizeBackground();
    bottle.visualizeObject(object1);
  }

  void transportDilemma() {
    transport.visualizeBackground();
    transport.visualizeObject(object1);
  }

  void foodDilemma() {
    food.visualizeBackground();
    food.visualizeObject(object1);
    food.visualizeObject(object2);
  }

  /*void xxxDilemma() {
  }*/
  
  void checkIfInteract(){
    bottle.interactionWithObject();
    transport.interactionWithObject();
    //food.interactionWithObject();
  }
}
