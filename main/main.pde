/*

 We are not able to export the application, as under the proces of us developing the application,
 the video library had been updated to 2.0, which causes the issue of not being able to export the application.
 
 */

import processing.video.*;
import processing.sound.*;

Pagemanager pages;

boolean thread;
String loadText = "Loading";

void setup() {
  fullScreen(); // Sets the program to run in fullscreen

  imageMode(CENTER); // Sets the image mode to be in center, as it felt the best to use.

  background(0);

  thread("importFiles"); // The program runs the importFiles function which, as the name states, imports the files.
}

void draw() {
  background(0); // Just to make sure there is not an after image from a previous frame, the program draws a background color.


  if (thread) {
    pages.pageController(); // Then following that, the program runs the pageController function from PageManager class, created at line 3 and initialized in the importFiles() function.
  } else {
    textAlign(CENTER, CENTER);
    textSize(40);
    text(loadText, width/2, height/2);
  }

  /*
  // --- FOR DEV PURPOSES --- //
   String fps = nf(frameRate, 0, -1);
   fill(0, 255, 0);
   textAlign(LEFT);
   text(fps, width-50, 50);
   // --- FOR DEV PURPOSES --- //
   */
}

// In this function, the program imports all the relevant files into the program, which then gets used when initializing the PageManager class.
void importFiles() {
  
  // --- SPRITES --- //

  // The program initializes an ArrayList for the sprites. The program handles it in ArrayList, so it can loop through a PImage array, instead of having every PImage.
  ArrayList<PImage[]> sprites = new ArrayList<PImage[]>();

  // For an object, it loads the images needed, resizes them and then adds that PImage array to the sprite ArrayList.
  PImage[] bottleObject = new PImage[]{loadImage("Bottle/waterBottle2.1.png"), loadImage("Bottle/waterBottle2.2.png")};
  // For resizing, the program has a for loop that goes through for every element in the above array.
  for (int i = 0; i < bottleObject.length; i++) {
    bottleObject[i].resize(bottleObject[i].width/5, bottleObject[i].height/5); // Then it takes that image dimensions and scales it down.
  }
  sprites.add(bottleObject); // Following that the program adds that array to the arrayList

  // ~~~ Same as above ~~~ //
  PImage[] keys = new PImage[]{loadImage("Transport/keyChain01.png"), loadImage("Transport/keyChainHighlight01.png")};
  for (int i = 0; i < keys.length; i++) {
    keys[i].resize(keys[i].width/5, keys[i].height/5);
  }
  sprites.add(keys);

  // ~~~ Same as above ~~~ //
  PImage[] hand = new PImage[]{loadImage("BedRoom/hand.png"), loadImage("BedRoom/handglow.png")};
  for (int i = 0; i < hand.length; i++) {
    hand[i].resize(hand[i].width/5, hand[i].height/5);
  }
  sprites.add(hand);

  // ~~~ Same as above ~~~ //
  PImage[] shopItem = new PImage[]{loadImage("Shopping/shopItem04.png"), loadImage("Shopping/shopItem04_highlight.png"), loadImage("Shopping/shopItem03.png"), loadImage("Shopping/shopItem03_highlight.png")};
  for (int i = 0; i < shopItem.length; i++) {
    shopItem[i].resize(shopItem[i].width/5, shopItem[i].height/5);
  }
  sprites.add(shopItem); 

  // ~~~ Same as above ~~~ //
  PImage[] food = new PImage[]{loadImage("Cooking/beef2.1.png"), loadImage("Cooking/beef2.2.png"), loadImage("Cooking/carrot2.1.png"), loadImage("Cooking/carrot2.2.png")};
  for (int i = 0; i < food.length; i++) {
    food[i].resize(food[i].width/5, food[i].height/5);
  }
  sprites.add(food);

  sprites.add(hand); // Adds the hand sprites once more, as it is needed for two different dilemmas

  loadText = loadText + ".";
  // --- SPRITES --- //

  // --- MOVIES --- //
  
  // For the background images, the program loads a lot of images and saves them in an array.
  PImage[] backgroundImages = new PImage[]{loadImage("Bottle/scene1-concept1.png"), loadImage("Transport/dilemma01_transport00.png"), loadImage("Factory/factorynew.png"), loadImage("Shopping/dilemma04_shopping00.png"), loadImage("Cooking/kitchenmadfri.jpg"), loadImage("BedRoom/bedroomnew.png")};

  // For importing the movies, it is split into two different variables. 
  String[] movieNames = {"Video Files/intro1.mov", "Video Files/Dilemma/introTilDilemma1.mov", "Video Files/Dilemma/introTilDilemma2.mov", "Video Files/Dilemma/introTilDilemma3.mov", "Video Files/Dilemma/introTilDilemma4.mov", "Video Files/Dilemma/introTilDilemma5.mov", "Video Files/Dilemma/outrobest.mov", "Video Files/Dilemma/outroworst.mov"}; // The first is the list of movieNames
  Movie[] listOfMovies = new Movie[movieNames.length]; // Which gets used to determine the length of of the Movie array

  // Then the program imports the movie names importing each individual file that gets listed in movieNames.
  for (int i = 0; i < movieNames.length; i++)
  {
    listOfMovies[i] = new Movie(this, movieNames[i]); // Then that movie file gets added to the movie array
    listOfMovies[i].pause(); // The program then pauses that video file, as the program does not want them all to play at the same time.
  }
  loadText = loadText + ".";
  
  // --- MOVIES --- //

  // --- SOUNDS --- //

  // Implementing the sounds will be done so as a mix of video and the sprite importing
  // This is because they have special importing type compared to images, but will not be used in the same way as videos
  // In this way there are room for adding multiple sounds at once as one array for each dilemma.
  ArrayList<SoundFile[]> sounds = new ArrayList<SoundFile[]>();

  String[] bottleSoundNames = {"Sounds/Tutorial/flaskecrunch.mp3"};
  SoundFile[] tutorialSounds = new SoundFile[bottleSoundNames.length];
  for (int i = 0; i < bottleSoundNames.length; i++)
  {
    tutorialSounds[i] = new SoundFile(this, bottleSoundNames[i]); // Then that movie file gets added to the movie array
  }
  sounds.add(tutorialSounds);

  String[] transportSoundNames = {"Sounds/transport/noeglerny.mp3"};
  SoundFile[] transportSounds = new SoundFile[transportSoundNames.length];
  for (int i = 0; i < transportSoundNames.length; i++)
  {
    transportSounds[i] = new SoundFile(this, transportSoundNames[i]); // Then that movie file gets added to the movie array
  }
  sounds.add(transportSounds);

  String[] workSoundNames = {"Sounds/sove/yawn.mp3"};
  SoundFile[] workSounds = new SoundFile[workSoundNames.length];
  for (int i = 0; i < workSoundNames.length; i++)
  {
    workSounds[i] = new SoundFile(this, workSoundNames[i]); // Then that movie file gets added to the movie array
  }
  sounds.add(workSounds);

  String[] shoppingSoundNames = {"Sounds/handle/indkoebskurv.mp3"};
  SoundFile[] shoppingSounds = new SoundFile[shoppingSoundNames.length];
  for (int i = 0; i < shoppingSoundNames.length; i++)
  {
    shoppingSounds[i] = new SoundFile(this, shoppingSoundNames[i]); // Then that movie file gets added to the movie array
  }
  sounds.add(shoppingSounds);

  String[] cookingSoundNames = {"Sounds/madlavning/sizzlenew.mp3"};
  SoundFile[] cookingSounds = new SoundFile[cookingSoundNames.length];
  for (int i = 0; i < cookingSoundNames.length; i++)
  {
    cookingSounds[i] = new SoundFile(this, cookingSoundNames[i]); // Then that movie file gets added to the movie array
  }
  sounds.add(cookingSounds);

  String[] gamingSoundNames = {"Sounds/sove/yawn.mp3"};
  SoundFile[] gamingSounds = new SoundFile[gamingSoundNames.length];
  for (int i = 0; i < gamingSoundNames.length; i++)
  {
    gamingSounds[i] = new SoundFile(this, gamingSoundNames[i]); // Then that movie file gets added to the movie array
  }
  sounds.add(gamingSounds);

  loadText = loadText + ".";
  // --- SOUNDS --- //

  // Then the program initializes the PageManager with the arrays and arrayList
  pages = new Pagemanager(listOfMovies, backgroundImages, sprites, sounds);

  // The program instantiates the different dilemmas
  pages.bottle = pages.instantiate(0, "SIDES", "LEFT");
  pages.transport = pages.instantiate(1, "SIDES", "RIGHT");
  pages.work = pages.instantiate(2, "SIDES", "RIGHT");
  pages.shopping = pages.instantiate(3, "MIDDLE", "RIGHT");
  pages.food = pages.instantiate(4, "MIDDLE", "RIGHT");
  pages.gaming = pages.instantiate(5, "SIDES", "LEFT");
  pages.finalScene = pages.instantiate(6, "FINAL", "");
  pages.finalScene2 = pages.instantiate(7, "FINAL", "");

  thread = true;
  println(millis()); // For debugging we see how long it takes in milliseconds
}

// As an event, mousePressed, the program calls the function "checkIfInteract()" for checking if the user clicks on an object
void mousePressed() {
  pages.checkIfInteract();
}

// Called every time a new frame is available to read
void movieEvent(Movie m) {
  m.read();
}
