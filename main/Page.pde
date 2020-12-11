class Page {
  Movie myMovie;
  PImage backgroundImage;
  
  float lengthOfMovie;

  Page(Movie _myMovie, PImage _backgroundImage) {
    myMovie = _myMovie;
    backgroundImage = _backgroundImage;
    myMovie.play();
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
}
