import processing.video.*;

int[] windowSize = {1920, 1080};

ArrayList<PImage[]> sprites = new ArrayList<PImage[]>();
PImage[] backgroundImages;
ArrayList<PImage[]> objects = new ArrayList<PImage[]>();

String[] movieNames = {"OAanimation.mov"};
Movie[] listOfMovies = new Movie[movieNames.length];

PImage[] bottleObject;
Movie bottleMovie;
PImage bottleBackgroundImage;
PImage[] trashcan;

//Object bottle;

Dilemma bottle;

Pagemanager pages;

void settings() {
  //size(windowSize[0], windowSize[1]);
  fullScreen();
}

void setup() {
  background(255);

  imageMode(CENTER);

  importFiles();
  
  pages.bottle = pages.instantiate(0);
  //bottle = new Object(object, width/2, height/2);
}

void draw() {
  background(0);
  
  pages.bottleDilemma();
  
  //bottle.visualizeObject();
  //bottle.controller();

  String fps = nf(frameRate, 0, -1);
  fill(0, 255, 0);
  textAlign(LEFT);
  text(fps, width-50, 50);
  //bottle.display();
  //bottle.update();
}

void importFiles() {
  //bottleMovie = new Movie(this, "OAanimation.mov");
  for (int i = 0; i < movieNames.length; i++)
  {
    listOfMovies[i] = new Movie(this, movieNames[i]);
    listOfMovies[i].play();
  }
  //listOfMovies = new Movie[]{new Movie(this, "OAanimation.mov"), new Movie(this, "OAanimation.mov"), new Movie(this, "OAanimation.mov"), new Movie(this, "OAanimation.mov")};
  //println(listOfMovies);

  //bottleBackgroundImage = loadImage("scene1-concept.png");
  backgroundImages = new PImage[]{loadImage("scene1-concept.png")};

  bottleObject = new PImage[]{loadImage("waterBottle2.1.png"), loadImage("waterBottle2.2.png")};
  for (int i = 0; i < bottleObject.length; i++) {
    bottleObject[i].resize(bottleObject[i].width/5, bottleObject[i].height/5);
  }
  sprites.add(bottleObject); 
  
  trashcan = new PImage[]{loadImage("trashCan.png")};
  for (int i = 0; i < trashcan.length; i++) {
    trashcan[i].resize(trashcan[i].width/2, trashcan[i].height/2);
  }
  objects.add(trashcan);

  pages = new Pagemanager(listOfMovies, backgroundImages, sprites, objects);
  println(millis());

  //bottle = new Dilemma(new Object(bottleObject, width/2, height/2), new Page(bottleMovie, bottleBackgroundImage, trashcan));
}

void mousePressed() {
  pages.bottle.interactionWithObject();
  //bottle.mouseFollow();
  //bottle.interactionWithObject();
}

// Called every time a new frame is available to read
void movieEvent(Movie m) {
  m.read();
}
