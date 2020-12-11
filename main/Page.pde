class Page {
  Movie myMovie;
  PImage backgroundImage;

  float lengthOfMovie;

  Page(Movie _myMovie, PImage _backgroundImage) {
    myMovie = _myMovie;
    backgroundImage = _backgroundImage;
    //myMovie.play();
    myMovie.jump(0);
  }

  boolean playMovie() { // Boolean function to play the movie
    
    image(myMovie, width/2, height/2); // Drawing the movie in the center of the screen

    boolean notFinished; // Boolean the check if the movie is finished or not

    // If statement to check if the current time of the movie has extended the duration of the movie.
    if (myMovie.time() >= myMovie.duration()) { 
      notFinished = false; // If the time has extended the duration, or is even to it, it will set the boolean "notFinished" to false, to signify it is finished.
    } else {
      notFinished = true; // Else it will say it is still ongoing and set it to true.
    }
    return notFinished; // Then it will return the boolean to tell where it is called from if it is finished or not.
  }

  void runMovie() {
    myMovie.play();
  }

  void backgroundImage() {
    image(backgroundImage, width/2, height/2, width, height);
  }
}
