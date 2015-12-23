float x, y, z;

void setup(){
  size(500, 500, P3D);
  background(255);
  //noStroke();
  x = width / 2;
  y = height / 2;
}

void draw(){
  fill(255, 255, 255, 1);
  rect(0, 0, width, height);
  
  float stepx = random(10);
  float stepy = random(10);
  float stepz = random(10);
  float choicex = random(0, 100);
  float choicey = random(0, 100);
  float choicez = random(0, 100);
  
  fill(0);
  translate(x, y, z);
  ellipseMode(CENTER);
  ellipse(0, 0, 20, 20);
  
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
  if(choicez < 55){
    z += stepz;  
  } else {
    z -= stepz;
  }
}
