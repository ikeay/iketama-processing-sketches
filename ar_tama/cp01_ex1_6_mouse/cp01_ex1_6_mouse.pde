Mover mover;
void setup() {
  size(500, 500);
  background(255);
  mover = new Mover(new PVector(500, 500));
  stroke(0);
}

void draw() {
  fill(255);
  rect(-20, -20, 540, 540);
  PVector mouse = new PVector(mouseX - 250, mouseY - 250);
  mover.before(mouse);
  mover.display();
}

class Mover {
  PVector world;
  PVector next;
  PVector mouse;
  Mover(PVector w) {
    world = w;
  }
  
  void before(PVector m) {
    next = m;
    mouse = new PVector(m.x + world.x / 2, m.y + world.y / 2);
    next.normalize();
    next.mult(20);
  }
  
  void display() {
    for (int i = 5; i < world.x; i += 20) {
      float distanceX = map(abs(i - mouse.x), 0, 500, 1, 0);
      for (int j = 5; j < world.y; j += 20) {
        float distanceY = map(abs(i - mouse.y), 0, 500, 1, 0);
        pushMatrix();
        translate(i, j);
        strokeWeight(1 + distanceX * 2 + distanceY * 2);
        line(next.x + (1 * distanceX), next.y + (1 * distanceY), 0, 0);
        popMatrix();
     }
    }
  }
  void after() {
  }
}