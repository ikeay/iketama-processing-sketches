float x;
float y;
float sd;
PVector world;
float xoff;
float yoff;
float zoff;
float[][] pixel;

void setup() {
  world = new PVector(500, 500);
  size(500, 500, OPENGL);
  background(255);
  sd = 5.0;
  x = y = (world.x / 2);
  fill(0);
  noStroke();
  xoff = yoff = zoff = 0;
  colorMode(HSB, 255);
  noiseDetail(5);
  pixel = new float[500][500];
  xoff = 10000;
  for (int x = 0; x < world.x; x+=20) {
   yoff = 0;
   for (int y = 0; y < world.y; y+=20) {
     pixel[x][y] = map(noise(xoff, yoff), 0, 1, 0, 10);
     println(pixel[x][y]);
     yoff += 0.01;
   }
   xoff += 0.01;
  }
}

void draw() {
  background(255, 10);
  for (int x = 0; x < world.x; x+=20) {
    for (int y = 0; y < world.y; y+=20) {
      fill(random(100, 200), random(100, 200), random(100, 200), 100);
      pushMatrix();
      translate(0, 0, pixel[x][y]);
      rect(x, y, 30, 30);
      popMatrix();
    }
  }
  
}