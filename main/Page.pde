class Page {
  Movie myMovie;
  PImage backgroundImage;
  SoundFile[] sound;

  // String for deciding if bad or good
  String choice;

  // Constructor that takes the movie file and the background image file
  Page(Movie _myMovie, PImage _backgroundImage, SoundFile[] _sound, String _choice) {
    myMovie = _myMovie;
    backgroundImage = _backgroundImage;
    sound = _sound;
    choice = _choice;
    myMovie.jump(0); // Sets the duration to the start, to make sure it does not play from the middle of the movie.
  }

  // Constructor for the final scene
  Page(Movie _myMovie) {
    myMovie = _myMovie;
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

  // Function to start the movie.
  //void runMovie() {

  //}

  // Function to play the sound
  void playSound(int i) {
    sound[i].jump(0); // starts it at 0
    sound[i].amp(0.5); // Sets the volume to half of the original
    sound[i].play(); // plays it
  }

  // Function for drawing the backgroundImage.
  void backgroundImage() {
    image(backgroundImage, width/2, height/2, width, height);
  }
}
