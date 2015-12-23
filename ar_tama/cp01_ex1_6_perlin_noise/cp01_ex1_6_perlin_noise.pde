Mover mover;

void setup() {
  mover = new Mover(new PVector(500, 500));
  size(500, 500);
  background(255);
}

void draw() {
  mover.update(new PVector(mouseX - 250, mouseY - 250));
  mover.display();
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