float x;
float y;
float sd;
PVector world;

void setup() {
  world = new PVector(500, 500);
  size(500, 500);
  background(255);
  sd = 5.0;
  x = y = (world.x / 2);
  fill(0);
  noStroke();
}

void draw() {
  float xDiff = sd * randomGaussian();
  float yDiff = sd * randomGaussian();
  x += xDiff;
  y += yDiff;
  if (x > world.x) {
    x = world.x;
  }
  if (y > world.y) {
    y = world.y;
  }
  if (x < 0) {
    x = 0;
  }
  if (y < 0) {
    y = 0;
  }
  ellipse(x, y, 2, 2);
}