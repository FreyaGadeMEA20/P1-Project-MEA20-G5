import processing.video.*;

//Variabels
int num= 50;
int[] Page = new int[num];
int i;
boolean PageChange=true;
int currentpage;

PImage[] object;

Object bottle;

void setup() {
  size(1000, 500);
  imageMode(CENTER);
  object = new PImage[]{loadImage("waterBottle2.1.png"), loadImage("waterBottle2.2.png")};
  for (int i = 0; i < object.length; i++) {
    object[i].resize(object[i].width/5, object[i].height/5);
  }

  for (i=0; i<num; i++) {
    Page[i]=i;
  }

  bottle = new Object(object, width/2, height/2);
}

void draw() {
  background(0);
  bottle.display();
  bottle.update();
}

void mousePressed() {
  bottle.mouseFollow();
}
