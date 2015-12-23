float x;
float y;
float sd;
PVector location;
PVector world;
float xt;
float yt;

void setup() {
  world = new PVector(500, 500);
  size(500, 500);
  background(255);
  sd = 5.0;
  location = new PVector((world.x / 2), (world.x / 2));
  fill(0);
  noStroke();
  xt = 0;
  yt = 10000;
}

void draw() {
  float xDiff = getDiff(xt);
  float yDiff = getDiff(yt);
  PVector diff = new PVector(map(xDiff, 0, 1, -2, 2), map(yDiff, 0, 1, -2, 2));
  location.add(diff);
  location.x = createWall(location.x, world.x);
  location.y = createWall(location.y, world.y);
  ellipse(location.x, location.y, 2, 2);
  xt += 0.01;
  yt += 0.01;
}

float getDiff(float t) {
  return noise(t);
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