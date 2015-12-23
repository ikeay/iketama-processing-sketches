float x;
float y;
float sd;
PVector world;
void setup() {
  world = new PVector(500, 500);
  size(500, 500);
  x = y = world.x / 2 + 10;
  background(255);
  colorMode(HSB, 255);
  noStroke();
  frameRate(60);
  sd = 70.0;
}

void draw() {
  float h = 40 * randomGaussian() + 100;
  float s = 40 * randomGaussian() + 150;
  PVector point = new PVector( sd * randomGaussian() + (world.x / 2), sd * randomGaussian() + (world.y / 2) );
  fill(h, s, 255, 180);
  ellipse(point.x, point.y, 10, 10);
}