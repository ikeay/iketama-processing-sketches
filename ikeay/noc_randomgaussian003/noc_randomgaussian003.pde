void setup(){
  size(500, 500);
  background(255);
  noStroke();
  colorMode(HSB, 360, 100, 100);
}

void draw(){
  float rnd_x = randomGaussian();
  float rnd_y = randomGaussian();
  float rnd_color = randomGaussian();
  
  float sd_x = 80;
  float mean_x = 250;
  float sd_y = 80;
  float mean_y = 250;
  
  float sd_color = 20;
  float mean_color = 190; 
  
  float x = rnd_x * sd_x + mean_x;
  float y = rnd_y * sd_y + mean_y;
  float c = rnd_color * sd_color + mean_color;
  
  fill(c, 100, 100, 50);
  ellipse(x, y, 20, 20);
  
}
