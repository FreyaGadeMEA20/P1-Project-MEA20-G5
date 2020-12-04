import processing.video.*;

int[] windowSize = {1920, 1080};

PImage[] bottleObject;
Movie bottleMovie;
PImage bottleBackgroundImage;
PImage trashcan;

//Object bottle;

Dilemma bottle;

void settings() {
  //size(windowSize[0], windowSize[1]);
  fullScreen();
}

void setup() {
  background(255);

  imageMode(CENTER);
  bottleMovie = new Movie(this, "OAanimation.mov");
  bottleObject = new PImage[]{loadImage("waterBottle2.1.png"), loadImage("waterBottle2.2.png")};
  for (int i = 0; i < bottleObject.length; i++) {
    bottleObject[i].resize(bottleObject[i].width/5, bottleObject[i].height/5);
  }
  bottleBackgroundImage = loadImage("scene1-concept.png");
  
  trashcan = loadImage("trashCan.png");
  trashcan.resize(trashcan.width/2, trashcan.height/2);

  bottle = new Dilemma(new Object(bottleObject, width/2, height/2), new Page(bottleMovie, bottleBackgroundImage, trashcan)); 

  //bottle = new Object(object, width/2, height/2);
}

void draw() {
  background(0);
  bottle.visualizeObject();
  bottle.controller();

  String fps = nf(frameRate, 0, -1);
  fill(0, 255, 0);
  textAlign(LEFT);
  text(fps, width-50, 50);
  //bottle.display();
  //bottle.update();
}

void mousePressed() {
  //bottle.mouseFollow();
  bottle.interactionWithObject();
}

// Called every time a new frame is available to read
void movieEvent(Movie m) {
  m.read();
}
