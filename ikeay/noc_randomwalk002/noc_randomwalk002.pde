float x, y;

void setup(){
  size(500, 500);
  background(255);
  //noStroke();
  x = width / 2;
  y = height / 2;
}

void draw(){
  
  noStroke();
  fill(255, 255, 255, 1);
  rect(0, 0, width, height);
  
  float stepx = random(10);
  float stepy = random(10);
  float choicex = random(0, 100);
  float choicey = random(0, 100);
  stroke(0);
  ellipse(x, y, 20, 20);
  
  if(choicex < 50){
     x += stepx;
  } else {
     x -= stepx;
  }
  if(choicey < 50){
     y += stepy;
  } else {
     y -= stepy;
  }
}
