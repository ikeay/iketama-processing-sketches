int sq_size = 15;
Fur f;

void setup(){
  size(600, 600);
  background(255);
  fill(255);
  stroke(0);
  strokeWeight(1);
  f = new Fur(sq_size);
}

void draw(){
  // 背景
  noStroke();
  rect(0, 0, width, height);
  
  // update
  PVector mouse = new PVector(mouseX - width/2, mouseY - height/2);
  f.update(mouse);
  f.display();
}

class Fur{
  PVector m;
  int size;
  
  Fur(int _s){
    size = _s;
  }
  
  void update(PVector _m){
    m = _m;
    m.normalize();
    m.mult(size);
  }
  
  void display(){
    stroke(0);
    for(int x = -size; x < width + size; x += size){
      for(int y = -size; y < height + size; y += size){
        line(x, y, x + m.x, y + m.y);
      }
    }
  }
}
