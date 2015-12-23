float x, y;
float tx, ty;
void setup(){
  size(500, 500);
  background(255);
  x = y = 250;
  tx = 0;
  ty = 10000;
}

void draw(){
  float stepx = map(noise(tx), 0, 1, -2, 2);
  float stepy = map(noise(ty), 0, 1, -2, 2);
  x += stepx;
  y += stepy;
  fill(0);
  ellipse(x, y, 2, 2);
  tx += 0.01;
  ty += 0.01; 
}

void wall(){
  if(x < 0){
    x = 0;
  }
  if(y < 0){
    y = 0;
  }
  if(x > width){
    x = width;
  }
  if(y > height){
    y = height;
  }
}
