Fish[] fishes = new Fish[10];

void setup() {
  for (int i=0; i<10; i++) {
   fishes[i] = new Fish(new PVector(500, 500)); 
  }
  size(500, 500);
  background(255);
  noStroke();
}

void draw() {
  fill(60, 100, 190, 40);
  rect(-10, -10, 600, 600);
  for (int i=0; i<10; i++) {
    fishes[i].update();
    fishes[i].display();
  }
}

class Fish {
  PVector world;
  PVector location;
  PVector pos;
  float fill;
  int changepoint;
  int t;
  
  Fish(PVector w) {
    world = w;
    location = new PVector(random(w.x), random(w.y));
    pos = PVector.random2D();
    pos.mult(random(-3, 3));
    fill = random(150, 230);
    changepoint = int(random(50, 200));
  }
  
  void update() {
    if (t > changepoint) {
      pos = PVector.random2D();
      pos.mult(random(-3, 3));
      t = 0;
    }
    pos.limit(5);
    location.add(pos);
    if (location.x > world.x + 50 || location.x < -50) {
     pos.x *= -1;
    }
    if (location.y > world.y + 50 || location.y < -50) {
     pos.y *= -1;
    }
    t++;
  }
  void display() {
    fill(fill);
    ellipse(location.x, location.y, 10, 20);
  }
}

class Mover {
  PVector world;
  PVector location;
  float t;
  
  Mover(PVector w) {
    world = w;
    location = new PVector(w.x / 2, w.y / 2);
  }
  
  void update(PVector m) {
    m.normalize();
    m.mult(noise(t) * 10);
    location.add(m);
    t += 0.1;
  }
  void display() {
    ellipse(location.x, location.y, 20, 20);
  }
}