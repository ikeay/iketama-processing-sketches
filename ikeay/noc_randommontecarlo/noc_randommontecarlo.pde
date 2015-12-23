float x, y;

void setup(){
  size(500, 500);
  background(255);
  x = y = 250; 
}

void draw(){
  float stepsize = 10 * montecarlo();
  
  float stepx = random(-stepsize, stepsize);
  float stepy = random(-stepsize, stepsize);
  
  x += stepx;
  y += stepy;
  
  fill(0);
  ellipse(x, y, 5, 5);
}

// 0から1までのランダムな分布
// 高い値が選ばれる確率が高くなる
float montecarlo(){
  while(true){
    float r1 = random(1);
    float probability = r1 * r1;
    float r2 = random(1);
    
    if(r2 < probability){
      return r1;
    }
  }
}
