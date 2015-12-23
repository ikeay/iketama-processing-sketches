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
  PVector loc;
  PVector vel;
  PVector acc;
  float tx, ty;
  
  Ball(int _r){
    r = _r;
    top = 10;
    loc = new PVector(width/2, height/2);
    vel = new PVector(0, 0);
    acc = new PVector(0, 0);
    tx = 0;
    ty = 10000;  
  }
  
  void update(){
    PVector mouse = new PVector(mouseX, mouseY);
    PVector dir = PVector.sub(mouse, loc);
    dir.normalize();
    dir.x = dir.x * map(noise(tx), 0, 1, 0, 2);
    dir.y = dir.y * map(noise(ty), 0, 1, 0, 2);
    acc = dir;
    vel.add(acc);
    vel.limit(top);
    loc.add(vel);
    tx += 0.01;
    ty += 0.01;
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


