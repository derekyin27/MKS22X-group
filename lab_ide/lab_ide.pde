PImage  img; 
float xdirect = 1;
float ydirect = 1;
interface Displayable {
  void display();
}

interface Moveable {
  void move();
}

abstract class Thing implements Displayable {
  float x, y;//Position of the Thing

  Thing(float x, float y) {
    this.x = x;
    this.y = y;
  }
  abstract void display();
}

class Rock extends Thing {

  float rand = random(25, 50);
  Rock(float x, float y) {
    super(x, y);
  }
  float ran = random(width);
  float rany = random(height);
  void display() {

    image(img, ran, rany, 60, 60);
  }
}

public class LivingRock extends Rock implements Moveable {
  float xspeed = random(0, 1);
  float yspeed = random(0, 1);
  LivingRock(float x, float y) {
    super(x, y);
  }
  void move() {
    xspeed += random(-1, 1);
    yspeed += random(-1, 1);
    x+=xspeed;
    y+=yspeed;
    if (x>975||x<25)xspeed*=-1;
    if (y>775||y<25) yspeed *= -1;
    if (xspeed>20)xspeed/=2;
    if (yspeed>20)yspeed/=2;
  }
}

class Ball extends Thing implements Moveable {
  Ball(float x, float y) {
    super(x, y);
  }
  float rand = random(25, 50);
  void display() {
    fill(255, 0, 0);
    ellipse(x, y, rand, rand);
    /* ONE PERSON WRITE THIS */
  }

  void move() {
    if (x <  width) {
      xdirect*=-1;
    }
    if (y<height) {
      ydirect*=-1;
    }
    x+= random(0, 1)*xdirect;
    y+= random(0, 1)*ydirect;
  }
}

/*DO NOT EDIT THE REST OF THIS */

ArrayList<Displayable> thingsToDisplay;
ArrayList<Moveable> thingsToMove;

void setup() {
  size(1000, 800);
  img = loadImage("rock.png");
  thingsToDisplay = new ArrayList<Displayable>();
  thingsToMove = new ArrayList<Moveable>();
  for (int i = 0; i < 10; i++) {
    Ball b = new Ball(50+random(width-100), 50+random(height-100));
    thingsToDisplay.add(b);
    thingsToMove.add(b);
    Rock r = new Rock(50+random(width-100), 50+random(height-100));
    thingsToDisplay.add(r);
  }
  for (int i = 0; i < 5; i++) {
    LivingRock m = new LivingRock(50+random(width-100), 50+random(height-100));
    thingsToDisplay.add(m);
    thingsToMove.add(m);
  }
}
void draw() {
  background(255);

  for (Displayable thing : thingsToDisplay) {
    thing.display();
  }
  for (Moveable thing : thingsToMove) {
    thing.move();
  }
}