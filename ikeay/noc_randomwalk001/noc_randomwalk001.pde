float x, y;

void setup(){
  size(500, 500);
  background(255);
  noStroke();
  x = 0;
  y = 0;
}

void draw(){
  fill(255, 255, 255, 1);
  rect(0, 0, width, height);
  x += random(-5.5, 6);
  y += random(-5.5, 6);
  fill(0);
  ellipse(x, y, 20, 20);
}
