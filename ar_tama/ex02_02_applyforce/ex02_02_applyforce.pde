Ball[] balls;
float t;
int windCount;
float currentWind;

void setup() {
  size(500, 500);
  background(255);
  noStroke();
  balls = new Ball[100];
  t = 0;
  windCount = 0;
  currentWind = 0.001;
  for (int i=0; i<100; i++) {
    balls[i] = new Ball(new PVector(500, 500));
  }
  colorMode(HSB);
}

void draw() {
  fill(255, 100);
  rect(-10, -10, 550, 550);
  PVector wind = new PVector(random(-1 * noise(t), noise(t)), 0);
  for (int i=0; i<100; i++) {
    PVector gravity = new PVector(0, 0.2 * balls[i].mass);
    balls[i].apply(wind);
    balls[i].apply(gravity);
    balls[i].update();
    balls[i].display();
  }
  t += 0.01;
  windCount++;
}

class Ball {
  PVector world;
  PVector location;
  PVector velocity;
  PVector acceleration;
  PVector colors;
  float mass;
  
  Ball(PVector w) {
    mass = random(0.1, 5);
    location = new PVector(random(20, w.x - 20), 30);
    world = w.copy();
    velocity = new PVector(0, 0);
    acceleration = velocity.copy();
    colors = new PVector(random(100, 250), random(50, 200), 200);
  }
  
  void apply(PVector force) {
    PVector f = PVector.div(force, mass);
    acceleration.add(f);
  }
  
  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
    _edges();
  }
  
  void display() {
    fill(colors.x, colors.y, colors.z, 100);
    ellipse(location.x, location.y, mass * 10, mass * 10);
  }
  
  void _edges() {
    if (location.x > world.x + 20 || location.x < -20) {
      velocity.x *= -1;
      location.x = (location.x > world.x + 20) ? world.x + 20 : -20;
    }
    if (location.y > world.y + 20) {
      velocity.y *= -1;
      location.y = world.y + 20;
    }
  }
}