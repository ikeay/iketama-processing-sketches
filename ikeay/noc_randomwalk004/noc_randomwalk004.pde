float x, y;

void setup(){
  size(500, 500);
  background(255);
  
  x = width / 2;
  y = height / 2;
}

void draw(){
  float stepx = random(5);
  float stepy = random(5);
  float choicex = random(100);
  float choicey = random(100);
  
  if(x < mouseX){
    if(choicex < 50) x += stepx;
  } else {
    if(choicex < 50) x -= stepx;
  }
  
  if(y < mouseY){
    if(choicey < 50) y += stepy;
  } else {
    if(choicey < 50) y -= stepy;
  }
  
  stroke(0);
  ellipse(x, y, 10, 10); 
}
