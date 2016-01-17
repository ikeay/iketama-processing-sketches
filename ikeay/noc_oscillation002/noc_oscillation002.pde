float r;

float angle;
float aVelocity = 0;
float aAcceleration = 0.01;

void setup(){
  background(255);
  size(500, 500);
  fill(0);
  strokeWeight(2);
  stroke(0);
  r = 0;
}

void draw(){
  background(255);
  rectMode(CENTER);
  
  translate(width/2, height/2);
  rotate(2 * PI * (angle / 360) );
  line(-30, 0, 30, 0);
  ellipse(-30, 0, 20, 20);
  ellipse(30, 0, 20, 20);
  
  aVelocity += aAcceleration;
  angle += aVelocity;
}
