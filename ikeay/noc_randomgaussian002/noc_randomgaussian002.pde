void setup(){
  size(640, 500);
  background(255);
  noStroke();
}

void draw(){
  float num = randomGaussian();
  float sd = 60; //標準偏差
  float mean = 320; //平均
  
  float x = sd * num + 320;
  
  fill(0, 10);
  ellipse(x, 180, 16, 16);
}
