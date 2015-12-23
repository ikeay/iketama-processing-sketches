float x;
float y;
float sd;
PVector world;
float xoff;
float yoff;
float zoff;

void setup() {
  world = new PVector(500, 500);
  size(500, 500);
  background(255);
  sd = 5.0;
  x = y = (world.x / 2);
  fill(0);
  noStroke();
  xoff = yoff = zoff = 0;
  colorMode(HSB, 100);
  //frameRate(10);
  noiseDetail(5);
}

void draw() {
  loadPixels();
  xoff = 0;
  for (int x = 0; x < world.x; x++) {
    yoff = 0;
    for (int y = 0; y < world.y; y++) {
      float bright = map(noise(xoff, yoff, zoff), 0, 1, 0, 255);
      pixels[x+y*int(world.x)] = color(bright);
      yoff += 0.01;
    }
    xoff += 0.01;
  }
  updatePixels();
  zoff += 0.01;
}