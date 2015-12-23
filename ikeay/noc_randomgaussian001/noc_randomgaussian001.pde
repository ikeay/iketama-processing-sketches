float x, y, hx, hy;

void setup(){
  size(500, 500);
  background(255);
  colorMode(HSB, 360, 100, 100);
  noStroke();
  x = width / 2;
  y = height / 2;
  hx = x;
  hy = y;
}

void draw(){
  //float h = random(100);
  //float s = random(100);
  float h = sqrt(random(52900));
  float s = randomGaussian() * 50;
  float b = 100;
  
  x = randomGaussian() * width / 5;
  y = randomGaussian() * height / 5;
  float r = random(sqrt(1000));
  fill(h, s, b, 100);
  ellipse(x + hx, y + hy, r, r);
}
