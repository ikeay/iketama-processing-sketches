Ball b;

void setup(){
  size(600, 600);
  background(255);
  noStroke();
  b = new Ball(50);
}

void draw(){
  // 背景
  fill(255, 255, 255, 10);
  rect(0, 0, width, height);
  
  // 円
  b.update();
  b.checkEdges();
  b.display();
}

class Ball{
  int r, top;
  float tx, ty;
  PVector t;
  PVector nacc;
  PVector loc;
  PVector vel;
  PVector acc;
  
  Ball(int _r){
    r = _r;
    top = 10;
    t = new PVector(0.0, 10000.0);
    loc = new PVector(width/2, height/2);
    vel = new PVector(0, 0);
    acc = new PVector(0, 0);  
  }
  
  void update(){
    acc.x = map(noise(t.x), 0, 1, 0, 5);
    acc.y = map(noise(t.y), 0, 1, 0, 5);
    vel.add(acc);
    vel.limit(top);
    loc.add(acc);
    t.add(0.01, 0,01);
  }
  
  void display(){
    fill(0);
    ellipse(loc.x, loc.y, r, r);
  }
  
  void checkEdges(){
    if(loc.x > width){
      loc.x = 0;
    } else if(loc.x < 0){
      loc.x = width;
    }
    
    if(loc.y > height){
      loc.y = 0;
    } else if(loc.y < 0){
      loc.y = height;
    }
    
  }
}


