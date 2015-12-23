float x, y;

void setup(){
  size(500, 500);
  noStroke();
  background(255);
  x = width / 2;
  y = height / 2;
}

void draw(){
  float choice_x = random(0, 100);
  float choice_y = random(0, 100);
  
  float rg_x = randomGaussian();
  float rg_y = randomGaussian();
  float sd_x = 3;
  float sd_y = 5;
  float avg_x = 2;
  float avg_y = 1;
  float step_x = rg_x * sd_x + avg_x;
  float step_y = rg_y * sd_y + avg_y;
  
  if(choice_x < 50){
    x += step_x;
  } else {
    x -= step_x;
  }
  
  if(choice_y < 50){
    y += step_y;
  } else {
    y -= step_y;
  }
  
  fill(0);
  ellipse(x, y, 10, 10);
}
