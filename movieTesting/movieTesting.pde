import processing.video.*;

Movie myMovie;
int counter;
float lengthOfMovie;

boolean playMovie = true;
PImage interactionImage;

void setup() {
  size(200, 200);
  interactionImage = loadImage("scene1-concept.png");
  interactionImage.resize(width,height);
  myMovie = new Movie(this, "OAanimation.mov");
  myMovie.play();
  lengthOfMovie = myMovie.duration();
}

void draw() {
  if (playMovie) {
    image(myMovie, 0, 0, width, height);
    //counter++;
    if (myMovie.time() >= lengthOfMovie) {
      playMovie = !playMovie;
      print("pog");  
    }  else {
      playMovie = true; 
    }
  } else {
   image(interactionImage, 0,0); 
  }
}

// Called every time a new frame is available to read
void movieEvent(Movie m) {
  m.read();
}
