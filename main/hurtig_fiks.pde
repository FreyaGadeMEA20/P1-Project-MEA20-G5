import processing.video.*;

int[] windowSize = {1920, 1080};

Pagemanager pages;

void settings() {
  //size(windowSize[0], windowSize[1]);
  fullScreen();
}

void setup() {
  background(255);

  imageMode(CENTER);

  importFiles();

  pages.bottle = pages.instantiate(0, "SIDES");
  //pages.transport = pages.instantiate(1, "SIDES");
  //pages.food = pages.instantiate(2, "MIDDLE");
}

void draw() {
  background(0);

  pages.bottleDilemma();
  //pages.transportDilemma();

  String fps = nf(frameRate, 0, -1);
  fill(0, 255, 0);
  textAlign(LEFT);
  text(fps, width-50, 50);
}

void importFiles() {
  ArrayList<PImage[]> sprites = new ArrayList<PImage[]>();

  String[] movieNames = {"OAanimation.mov", "OAanimation.mov", "OAanimation.mov"};
  Movie[] listOfMovies = new Movie[movieNames.length];

  for (int i = 0; i < movieNames.length; i++)
  {
    listOfMovies[i] = new Movie(this, movieNames[i]);
    listOfMovies[i].play();
  }

  PImage[] backgroundImages = new PImage[]{loadImage("scene1-concept1.png"), loadImage("dilemma01_sketch00.png"), loadImage("kitchenmadfri.jpg")};

  PImage[] bottleObject = new PImage[]{loadImage("waterBottle2.1.png"), loadImage("waterBottle2.2.png")};
  for (int i = 0; i < bottleObject.length; i++) {
    bottleObject[i].resize(bottleObject[i].width/5, bottleObject[i].height/5);
  }
  sprites.add(bottleObject); 

  PImage[] keys = new PImage[]{loadImage("keyChain01.png"), loadImage("keyChainHighlight01.png")};
  for (int i = 0; i < keys.length; i++) {
    keys[i].resize(keys[i].width/5, keys[i].height/5);
  }
  sprites.add(keys);

  PImage[] food = new PImage[]{loadImage("beef.png"), loadImage("carrot.png")};
  for (int i = 0; i < food.length; i++) {
    food[i].resize(food[i].width/5, food[i].height/5);
  }
  sprites.add(food);


  pages = new Pagemanager(listOfMovies, backgroundImages, sprites);
  println(millis());
}

void mousePressed() {
  pages.checkIfInteract();
}

// Called every time a new frame is available to read
void movieEvent(Movie m) {
  m.read();
}
