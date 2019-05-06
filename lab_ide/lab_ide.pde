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
  float rand = random(25,50);
  Rock(float x, float y) {
    super(x, y);
  }

  void display() {
    fill(192,192,192);
    ellipse(x,y,rand,rand);
  }
}

public class LivingRock extends Rock implements Moveable {
  LivingRock(float x, float y) {
    super(x, y);
  }
  void move() {
    x+= random(0,10);
    y+= random(0,10);
    if(x>1000)x=0;
    if(y>1000) y = 0;
  }
}

class Ball extends Thing implements Moveable {
  Ball(float x, float y) {
    super(x, y);
  }
float rand = random(25,50);
  void display() {
    fill(255, 0, 0);
    ellipse(x, y, rand, rand);
    /* ONE PERSON WRITE THIS */
  }

  void move() {
    x+= random(0,1);
    y+= random(0,1);
  }
}

/*DO NOT EDIT THE REST OF THIS */

ArrayList<Displayable> thingsToDisplay;
ArrayList<Moveable> thingsToMove;

void setup() {
  size(1000, 800);

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
