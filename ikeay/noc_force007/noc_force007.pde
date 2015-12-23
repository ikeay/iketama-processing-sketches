// 途中だと思う

Liquid liquid;
Box box;

PVector gravity;
int mass;

void setup(){
  size(500, 500);
  background(255);
  noStroke();
  
  for(int i = 0; i < balls.length; i++){
    balls[i] = new Ball(i * 50, random(0, height/2)); 
  }
  liquid = new Liquid(0, height / 2, width, height/2, 2);
  
  mass = 10;
  gravity = new PVector(0, 0.1 * mass);
}

void draw(){
  background(255);
  
  // Liquid
  liquid.display();
 

  if(liquid.contains(balls[i])){
    PVector dragForce = liquid.drag(balls[i]);
    box.applyForce(dragForce);
  }
  balls[i].applyForce(gravity);
  balls[i].update();
  balls[i].checkEdges();
  balls[i].display(); 
}

class Liquid{
  float x, y, w, h;
  float c;
  
  Liquid(float _x, float _y, float _w, float _h, float _c){
    x = _x;
    y = _y;
    w = _w;
    h = _h;
    c = _c;
  }
  
  void display(){
    noStroke();
    fill(175);
    rect(x, y, w, h);
  }
  
  boolean contains(Box b){
    PVector l = b.loc;
    return l.x > x - 10 && l.x < x + w && l.y > y - 10 && l.y <y + h;
  }
  
  PVector drag(Box b){
    float speed = b.vel.mag(); // ベクターから質量を計算する
    float dragMagnitude = c * speed * speed; // Cd * v2
    
    PVector dragForce = b.vel.get();
    dragForce.mult(-1);
    
    dragForce.normalize();
    dragForce.mult(dragMagnitude);
    
    return dragForce;
  }
}

class Box{
  
  Box{
  
  }
  
  
}
