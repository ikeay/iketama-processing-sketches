Liquid liquid;
Ball[] balls = new Ball[10];

PVector gravity;
int mass;

void setup(){
  size(500, 500);
  background(255);
  noStroke();
  
  for(int i = 0; i < balls.length; i++){
    balls[i] = new Ball(i * 50, 0); 
  }
  liquid = new Liquid(0, height / 3, width, height/3, 0.5);
  
  mass = 10;
  gravity = new PVector(0, 0.1 * mass);
}

void draw(){
  background(255);
  
  // Liquid
  liquid.display();
 
  for(int i = 0; i < balls.length; i++){  
    // Balls
    if(liquid.contains(balls[i])){
      PVector dragForce = liquid.drag(balls[i]);
      balls[i].applyForce(dragForce);
    }
    balls[i].applyForce(gravity);
    balls[i].update();
    balls[i].checkEdges();
    balls[i].display(); 
  }
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
  
  boolean contains(Ball b){
    PVector l = b.loc;
    return l.x > x - 10 && l.x < x + w && l.y > y - 10 && l.y <y + h;
  }
  
  PVector drag(Ball b){
    float speed = b.vel.mag(); // ベクターから質量を計算する
    float dragMagnitude = c * speed * speed; // Cd * v2
    
    PVector dragForce = b.vel.get();
    dragForce.mult(-1);
    
    dragForce.normalize();
    dragForce.mult(dragMagnitude);
    
    return dragForce;
  }
}

class Ball{
  float x, y;
  int r, m;
  PVector loc, vel, acc;
  
  Ball(float _x, float _y){
    r = 20;
    m = mass;
    loc = new PVector(_x, _y);
    vel = new PVector(0, 0); // 速さ
    acc = new PVector(0, 0); // 加速度
  }
  void update(){
    vel.add(acc);
    loc.add(vel);
    acc.mult(0);
  }
  void display(){
    fill(0);
    ellipse(loc.x, loc.y, r, r);
  }
  void applyForce(PVector f){
    PVector force = PVector.div(f, mass);
    acc.add(force);
  }
  
  void checkEdges(){
    if(loc.x > width){
      loc.x = width;
      vel.x *= -1; 
    } else if(loc.x < 0){
      loc.x = 0;
      vel.x *= -1;    
    }
    if(loc.y > height){
      loc.y = height;
      vel.y *= -1; 
    } else if(loc.y < 0) {
      loc.y = 0;
      vel.y *= -1; 
    }
  }
  
}
