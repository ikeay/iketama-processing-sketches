Baloon baloon;
Blow blow;

void setup() {
  baloon = new Baloon(new PVector(500, 500));
  blow = new Blow();
  size(500, 500);
  background(255);
  noStroke();
}

void draw() {
  fill(255, 100);
  rect(-10, -10, 550, 550);
  baloon.update(blow.update());
  baloon.display();
}

class Blow {
  float blow;
  float t;
  Blow() {
    blow = 0;
    t    = 100;
  }
  float update(){
    blow = (noise(t) - 0.5) * 0.01;
    t = t + 0.01;
    return blow;
  }
}

class Baloon {
  PVector world;
  PVector location;
  PVector accerlation;
  float floating;
  
  Baloon(PVector w) {
    world = w;
    floating = 0.01;
    location = new PVector(w.x / 2, w.y);
    accerlation = new PVector(0, 0);
  }
  void update(float blow) {
    accerlation.add(new PVector(blow, random(-0.05, 0)));
    accerlation.limit(4);
    if (location.y < -10) {
     accerlation.add(new PVector(0, accerlation.y * -1 * 1.9));
    }
  }
  void display() {
    stroke(1);
    line (location.x, location.y, world.x / 2, world.y);
    noStroke();
    fill(60, 40, 170);
    location.add(accerlation);
    ellipse(location.x, location.y, 100, 120);
  }
}