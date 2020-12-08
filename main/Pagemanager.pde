class Pagemanager {
  //Dilemma[] arrayOfPages;
  Dilemma bottle;

  int bottleDilemmaInt = 0;
  

  Movie[] listOfMovies;
  PImage[] backgroundImages;
  ArrayList<PImage[]> sprites;
  ArrayList<PImage[]> objects = new ArrayList<PImage[]>();

  // :)
  
  Pagemanager(Movie[] _listOfMovies, PImage[] _backgroundImages, ArrayList<PImage[]> _sprites, ArrayList<PImage[]> _objects) {
    listOfMovies = new Movie[_listOfMovies.length];
    backgroundImages = new PImage[_backgroundImages.length];
    
    
    arrayCopy(_listOfMovies, listOfMovies);
    arrayCopy(_backgroundImages, backgroundImages);
    
    sprites = new ArrayList<PImage[]>();
    for (int i = 0; i < _sprites.size(); i++){
      sprites.add(_sprites.get(i));
    }
    
    objects = new ArrayList<PImage[]>();
    for (int i = 0; i < _objects.size(); i++){
      objects.add(_objects.get(i));
    }
    
    //bottle = new Dilemma(new Object(sprites.get(bottleDilemmaInt), width/2, height/2), new Page(listOfMovies[bottleDilemmaInt], backgroundImages[bottleDilemmaInt], objects.get(bottleDilemmaInt)));
  }
  
  Dilemma instantiate(int dilemmaToInstantiate){
    
    Dilemma instantiatedDilemma = new Dilemma(new Object(sprites.get(dilemmaToInstantiate), width/2, height/2), new Page(listOfMovies[dilemmaToInstantiate], backgroundImages[dilemmaToInstantiate], objects.get(dilemmaToInstantiate)));
    
    return instantiatedDilemma;
  }

  void bottleDilemma() {
    
   
    //bottle.visualizeBackground();
    bottle.visualizeObject();
  }

  void transportDilemma() {
  }

  void foodDilemma() {
  }

  void xxxDilemma() {
  }
}
