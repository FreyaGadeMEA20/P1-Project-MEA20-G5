class Page {
  Movie myMovie;
  PImage backgroundImage;
  PImage[] object;
  

  float lengthOfMovie;

  Page(Movie _myMovie, PImage _backgroundImage, PImage[] _object) {
    myMovie = _myMovie;
    backgroundImage = _backgroundImage;
    myMovie.play();
    object = _object;
  }

  boolean playMovie() {

    image(myMovie, width/2, height/2);

    if (myMovie.time() >= myMovie.duration()) { 
      return false;
    } else {
      return true;
    }
  }

  void backgroundImage() {
    image(backgroundImage, width/2, height/2, width, height);
  }
  
  void objectOnScreen(){
    image(object[0], width/4, height/2);
  }
}
