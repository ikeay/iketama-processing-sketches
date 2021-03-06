float x;
float y;
PVector world;
void setup() {
  x = y = 0;
  world = new PVector(500, 500);
  size(500, 500);
  background(255);
}

void draw() {
  float x_diff = random(-5, 5);
  float y_diff = random(-5, 5);
  float z_diff = random(-5, 5);
  x += (x_diff * 2) + (z_diff);
  y += (y_diff * 2) + (z_diff);
  if (x < 0) { x = 0; }
  if (x > world.x) { x = world.x; }
  if (y < 0) { y = 0; }
  if (y > world.y) { y = world.y; }
  ellipse(x, y, 20, 20);
  fill(255, 25);
  rect(-1, -1, world.x + 2, world.y + 2);
}