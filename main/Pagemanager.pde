

class Pagemanager {
  Dilemma[] arrayOfPages;

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
    
    sprites = new ArrayList<PImage[]>(_sprites.size());
    for (int i = 0; i >= _sprites.size();i++){
      sprites.add(_sprites.get(i));
    }
    
    objects = new ArrayList<PImage[]>(_objects.size());
    for (int i = 0; i >= _objects.size();i++){
      objects.add(_objects.get(i));
    }
  }

  void bottleDilemma() {
  }

  void transportDilemma() {
  }

  void foodDilemma() {
  }

  void xxxDilemma() {
  }
}
