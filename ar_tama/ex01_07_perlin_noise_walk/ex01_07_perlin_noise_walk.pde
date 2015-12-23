float x;
float y;
float sd;
PVector world;
float xt;
float yt;

void setup() {
  world = new PVector(500, 500);
  size(500, 500);
  background(255);
  sd = 5.0;
  x = y = (world.x / 2);
  fill(0);
  noStroke();
  xt = 0;
  yt = 10000;
}

void draw() {
  float xDiff = getDiff(xt);
  float yDiff = getDiff(yt);
  x += map(xDiff, 0, 1, -2, 2);
  y += map(yDiff, 0, 1, -2, 2);
  x = createWall(x, world.x);
  y = createWall(y, world.y);
  ellipse(x, y, 2, 2);
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