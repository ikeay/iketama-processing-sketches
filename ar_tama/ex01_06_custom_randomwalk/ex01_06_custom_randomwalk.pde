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
  float xDiff = getDiff();
  float yDiff = getDiff();
  x += random(-xDiff, xDiff);
  y += random(-yDiff, yDiff);
  x = createWall(x, world.x);
  y = createWall(y, world.y);
  ellipse(x, y, 2, 2);
}

float getDiff() {
  float diff;
  while (true) {
    diff = random(0, 10);
    if (random(0, 100) < diff * diff) {
      return diff;
    }
  }
}

float createWall(float pos, float size) {
  if (pos > size) {
    pos = size;
  }
  if (pos < 0) {
    pos = 0;
  }
  return pos;
}